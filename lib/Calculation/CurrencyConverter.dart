import 'dart:convert';
import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CurrencyConverter extends StatefulWidget {
  @override
  _CurrencyConverterState createState() => _CurrencyConverterState();
}



class _CurrencyConverterState extends State {

  String fromCurrency = 'USD';
  String toCurrency = 'MYR';
  String result='';
  final amountController = TextEditingController();

  //the default currency list
  //will be populated by api once the api is loaded in _loadCurrencies();;
  List<String> currencies=[
    'USD',
    'MYR'
  ];
  String currencyOutput= ' ';


  @override
  void initState() {

    super.initState();
    _loadCurrencies();

  }



  Future<String> _loadCurrencies() async {
    String uri = "https://api.exchangeratesapi.io/latest?base=MYR";
    var response = await http
        .get(Uri.encodeFull(uri), headers: {"Accept": "application/json"});
    var responseBody = json.decode(response.body);
    Map curMap = responseBody['rates'];
    currencies = curMap.keys.toList();
    setState(() {});
    log(currencies.toString());
    return "Success";
  }


  Future<String> _doConversion() async {

    String uri = "https://api.exchangeratesapi.io/latest?base=$fromCurrency&symbols=$toCurrency";
    var response = await http
        .get(Uri.encodeFull(uri), headers: {"Accept": "application/json"});
    var responseBody = json.decode(response.body);

    setState(() {
      double converted=(responseBody["rates"][toCurrency]);
      if(amountController.text.isNotEmpty){
        double finalamount=converted*double.parse(amountController.text);
        result = finalamount.toStringAsFixed(2);
      }else {
        result = '';
      }

    });

    return "Success";
  }
  


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(title: Text('Currency Converter')),
        body: Align(
            alignment: Alignment.centerLeft,
            child:
            Container(
              child: Column(

                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[

                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0)),


                    Container(
                      width:200,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: amountController,
                        onChanged: (String value){
                          _doConversion();
                        },
                        decoration: const InputDecoration(
                          hintText: 'Amount to convert',
                          labelText: 'Amount',
                          icon: Icon(Icons.money),
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter Amount';
                          }
                          return null;
                        },
                      ),
                    ),

                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0)),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[

                        DropdownButton<String>(
                          value: fromCurrency,
                          icon: Icon(Icons.arrow_downward),
                          iconSize: 24,
                          elevation: 16,
                          style: TextStyle(
                              color: Colors.deepPurple
                          ),
                          underline: Container(
                            height: 2,
                            color: Colors.deepPurpleAccent,
                          ),
                          onChanged: (String newValue) {

                            setState(() {
                              fromCurrency = newValue;
                            });
                            _doConversion();
                          },
                          items: currencies.map((allCurrency) {
                            return DropdownMenuItem<String>(
                              value: allCurrency,
                              child: Text(allCurrency),
                            );
                          })
                              .toList(),
                        ),

                        DropdownButton<String>(
                          value: toCurrency,
                          icon: Icon(Icons.arrow_downward),
                          iconSize: 24,
                          elevation: 16,
                          style: TextStyle(
                              color: Colors.deepPurple
                          ),
                          underline: Container(
                            height: 2,
                            color: Colors.deepPurpleAccent,
                          ),
                          onChanged: (String newValue) {
                            setState(() {
                              toCurrency = newValue;
                            });

                            _doConversion();
                          },
                          items: currencies.map((allCurrency) {
                            return DropdownMenuItem<String>(
                              value: allCurrency,
                              child: Text(allCurrency),
                            );
                          })
                              .toList(),
                        ),

                      ],

                    ),


                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0)),


                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(amountController.text+ ' '+fromCurrency+' = ',
                      style: TextStyle(fontSize: 18),),
                      Text(result+' '+toCurrency,
                          style: TextStyle(fontSize: 18))
                    ]
                  ),





                  ]

              ),
            )


        )
    );
  }
}

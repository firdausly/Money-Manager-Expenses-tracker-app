import 'package:flutter/material.dart';


class InvestmentCalculator extends StatefulWidget {

  _InvestmentCalculator createState() => _InvestmentCalculator();

}
enum Investment { one_time, reoccuring }

class _InvestmentCalculator extends State {
  final _formKey = GlobalKey<FormState>();
  final investmentController = TextEditingController();
  final interestController = TextEditingController();
  final durationController = TextEditingController();

  String totalValue="";
  String duration="";

  String totalInvest="";

  Investment _investmentType = Investment.one_time;



void investCalculator() {


  if (_formKey.currentState.validate()) {
    double initialinvestment = double.parse(investmentController.text);
    double interest = double.parse(interestController.text);
    int duration = int.parse(durationController.text);

    setState(() {
      this.duration=duration.toString();
    });

    if(_investmentType==Investment.one_time){
      double value=initialinvestment;
      for(int i=0;i<duration;i++){
        value+=(value*interest/100);
      }

      setState(() {
        this.totalValue=value.toStringAsFixed(2);
      });
      double totalInvestment=value-initialinvestment;
      setState(() {
        this.totalInvest=totalInvestment.toStringAsFixed(2);
      });



    } else if(_investmentType==Investment.reoccuring){
      double value=initialinvestment;
      for(int i=0;i<duration;i++){
        value+=initialinvestment+(value*interest/100);
      }

      setState(() {
        this.totalValue=value.toStringAsFixed(2);
      });
      double totalInvestment=value-initialinvestment;
      setState(() {
        this.totalInvest=totalInvestment.toStringAsFixed(2);
      });
    }



  }

}



  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(title: Text('Investment Calculator')),
        body: Align(
            alignment: Alignment.topLeft,
            child:
            SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[

                      Form(
                          key: _formKey,
                          child: (
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[


                                    Text('Investment Type',
                                        textAlign: TextAlign.start),

                                   Row(
                                     children: <Widget>[

                                        Radio(
                                             value: Investment.one_time,
                                             groupValue: _investmentType,
                                             onChanged: (Investment value) {
                                               setState(() { _investmentType = value; });
                                             },
                                           ),
                                        Text('One Time'),


                                      Radio(
                                             value: Investment.reoccuring,
                                             groupValue: _investmentType,
                                             onChanged: (Investment value) {
                                               setState(() { _investmentType = value; });
                                             },
                                           ),
                                       Text('Recurring'),


                                     ],
                                   ),








                                    TextFormField(
                                      keyboardType: TextInputType.number,
                                      controller: investmentController,
                                      decoration: const InputDecoration(
                                        icon: const Icon(Icons.attach_money),
                                        labelText: 'Initial Investment',
                                        hintText: 'Enter Initial investment',
                                      ),
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'Please enter total investment';
                                        }
                                        return null;
                                      },
                                    ),

                                    Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 16.0)),


                                    TextFormField(
                                      keyboardType: TextInputType.number,
                                      controller: interestController,
                                      decoration: const InputDecoration(
                                        icon: Icon(Icons.money_off_csred_sharp),
                                        labelText: 'Annual Interest ',
                                        hintText: 'Enter Interest percentage',
                                      ),
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'Please enter percentage interest';
                                        }
                                        return null;
                                      },
                                    ),

                                    Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 16.0)),

                                    TextFormField(
                                      keyboardType: TextInputType.number,
                                      controller: durationController,
                                      decoration: const InputDecoration(
                                        icon: Icon(Icons.timeline),
                                        labelText: 'Duration (in year) ',
                                        hintText: 'Enter Duration (year)',
                                      ),
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'Please enter Duration(year)';
                                        }
                                        return null;
                                      },
                                    ),

                                    Align(
                                      alignment: Alignment.center,
                                      child: Column(
                                        children: <Widget>[

                                          Padding(
                                              padding: const EdgeInsets.symmetric(vertical: 16.0),
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  // Validate will return true if the form is valid, or false if
                                                  // the form is invalid.
                                                  investCalculator();
                                                  FocusScope.of(context).unfocus();

                                                },
                                                child: Text('Calculate',
                                                    textAlign: TextAlign.center),
                                              )),

                                          if(duration.isNotEmpty && totalInvest.isNotEmpty
                                              && totalInvest.isNotEmpty)
                                          Card(
                                            elevation:4,

                                            child: Padding(
                                              padding: const EdgeInsets.all(16.0),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: <Widget>[



                                                    Container(
                                                      alignment:Alignment.center,
                                                      child: Column(
                                                        children: [
                                                          Text('Your Final Balance after '+duration+' year :',
                                                              style: TextStyle(fontSize: 18)),

                                                          Text(totalValue,
                                                              style: TextStyle(fontSize: 18)),
                                                          Padding(
                                                              padding: const EdgeInsets.symmetric(vertical: 16.0)),

                                                          Text('You Earn ',
                                                              style: TextStyle(fontSize: 18)),
                                                          Text(totalInvest,
                                                              style: TextStyle(fontSize: 18))



                                                        ],
                                                      ),
                                                    ),









                                                ],
                                              ),
                                            ),
                                          ),








                                        ],
                                      ),




                                    ),







                                  ]
                              )


                          )





                      )







                    ]

                ),
              ),
            )


        );

  }




}

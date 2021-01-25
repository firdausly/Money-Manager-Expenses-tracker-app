import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';




class LoanCalculator extends StatefulWidget {
  @override
  _LoanCalculatorState createState() => _LoanCalculatorState();
}


class _LoanCalculatorState extends State<LoanCalculator> {
  final _formKey = GlobalKey<FormState>();

  final principalController = TextEditingController();

  final interestController = TextEditingController();

  final durationController = TextEditingController();


  String emi="";

  String duration="";

  String totalInterest="";

  String totalPayment="";

  double percentage=0;

  void _calculate(){

    // the formula is from
    // https://www.calculatorsoup.com/calculators/financial/loan-calculator-simple.php


    if (_formKey.currentState.validate()) {

      double principal = double.parse(principalController.text);
      double interest = double.parse(interestController.text);
      double duration = double.parse(durationController.text);

      setState(() {
        this.duration=duration.toStringAsFixed(0);
      });

      double month=duration*12;
      double interestpermonth=(interest/100)/12;
      double deNom=pow(1+interestpermonth,month);

      //the formula method
      double monthly=(principal*interestpermonth*deNom) / (deNom -1);


      double totalpayment =(monthly*month);
      double totalInterest=totalpayment -principal;

      setState(() {
        this.emi=monthly.toStringAsFixed(2);
        this.totalInterest=totalInterest.toStringAsFixed(2);
        this.totalPayment=totalpayment.toStringAsFixed(2);
        this.percentage=principal/totalpayment;
      });
    }


  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(title: Text('Loan Calculator')),
        body: Align(
            alignment: Alignment.topLeft,
            child: SingleChildScrollView(
              child: Column(

                  children: <Widget>[

                    Form(
                        key: _formKey,

                        child: (
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[




                                  TextFormField(
                                    keyboardType: TextInputType.number,
                                    onChanged: (value){
                                      _calculate();
                                    },
                                    controller: principalController,
                                    decoration: const InputDecoration(
                                      icon: const Icon(Icons.attach_money),
                                      hintText: 'Enter Principal',
                                      labelText: 'Principal/ Loan Amount',

                                    ),
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please enter Principal';
                                      }
                                      return null;
                                    },
                                  ),

                                  Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 16.0)),


                                  TextFormField(
                                    keyboardType: TextInputType.number,
                                    controller: interestController,
                                    onChanged: (value){
                                      _calculate();
                                    },
                                    decoration: const InputDecoration(
                                      icon: const Icon(Icons.money_off_csred_sharp),
                                      hintText: 'Enter Interest',
                                      labelText: 'Annual Interest',
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
                                    onChanged: (value){
                                      _calculate();
                                    },
                                    decoration: const InputDecoration(
                                      icon: const Icon(Icons.timeline),
                                      hintText: 'Enter Duration',
                                      labelText: 'Loan Duration',
                                    ),
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please enter Duration(year)';
                                      }
                                      return null;
                                    },
                                  ),

                                  Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 16.0)),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Column(
                                      children: <Widget>[




                                        Text('Your Equated Monthly Installment',
                                          style: TextStyle(fontSize: 18)),

                                        Text('RM'+emi,
                                            style: TextStyle(fontSize: 18)),

                                        Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 16.0)),


                                        Text('Total Payment',
                                            style: TextStyle(fontSize: 18)),

                                        Text('RM'+totalPayment,
                                            style: TextStyle(fontSize: 18)),

                                        Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 16.0)),

                                        LinearProgressIndicator(
                                          value: percentage,
                                          minHeight: 10,
                                          valueColor: AlwaysStoppedAnimation<Color>(Colors.teal),
                                          backgroundColor: Colors.grey,
                                        )



                                      ],
                                    ),




                                  ),



                                  Row(
                                    children: <Widget>[

                                      Icon(
                                        Icons.stop_circle,
                                        color: Colors.teal,
                                      ),
                                      Text('Principal - RM '+principalController.text)

                                    ],
                                  ),

                                  Row(
                                    children: <Widget>[

                                      Icon(
                                        Icons.stop_circle,
                                        color: Colors.grey,
                                      ),
                                      Text('Total Interest - RM '+totalInterest)

                                    ],
                                  ),







                                ]
                            )


                        )





                    ),







                  ]

              ),
            )


        )
    );
  }
}

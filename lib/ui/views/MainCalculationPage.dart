import 'package:flutter/material.dart';

import 'package:moneymanager/Calculation/SplitBill.dart';
import 'package:moneymanager/Calculation/InvestmentCalculator.dart';
import 'package:moneymanager/Calculation/LoanCalculator.dart';
import 'package:moneymanager/Calculation/CurrencyConverter.dart';






class MainCalculationPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(title: Text('Calculation')),
        body: Center(
            child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
                children: <Widget>[


                  //column cuz wanna add text just below the iconbutton
                  Column(
                    children: [
                      IconButton(
                        icon: Icon(Icons.receipt_long),
                        tooltip: 'Split Bill',
                        iconSize: 100,
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => SplitBill()));
                        },
                      ),

                      Text('Split Bill'),
                    ],
                  ),


                  Column(
                    children: [
                      IconButton(
                        icon: Icon(Icons.local_atm),
                        iconSize: 100,
                        tooltip: 'Investment Calculator',
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => InvestmentCalculator()));
                        },
                      ),

                      Text('Investment Calculator'),
                    ],
                  ),


                  Column(
                    children: [
                      IconButton(
                        icon: Icon(Icons.monetization_on),
                        iconSize: 100,
                        tooltip: 'Loan Calculator',
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => LoanCalculator()));
                        },
                      ),
                      Text('Loan Calculator'),
                    ],
                  ),



                  Column(
                    children: [
                      IconButton(
                        icon: Icon(Icons.euro_symbol),
                        iconSize: 100,
                        tooltip: 'Currency Converter',
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => CurrencyConverter()));
                        },
                      ),

                      Text('Currency Converter'),
                    ],
                  ),



                ])));
  }
}

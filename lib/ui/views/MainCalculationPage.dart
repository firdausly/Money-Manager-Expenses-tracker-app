import 'package:curved_navigation_bar/curved_navigation_bar.dart';
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
        bottomNavigationBar: CurvedNavigationBar(
          height: 55,
          index: 3,
          backgroundColor: Colors.white,
          // buttonBackgroundColor: Colors.greenAccent,
          color: Colors.greenAccent,
          items: [
            Icon(Icons.pie_chart),
            Icon(Icons.notifications),
            Icon(Icons.home_filled,size: 40,),
            Icon(Icons.calculate),
            Icon(Icons.note_add),
          ],
          onTap: (index){
            switch(index.toString()){
              case '0':
                return Navigator.of(context).pushNamed("chart");
              case '1':
                return Navigator.of(context).pushNamed("reminder");
              case '2':
                return Navigator.of(context).pushNamed("home");
              case '3':
                return Navigator.of(context).pushNamed("calculation");
              case '4':
                return Navigator.of(context).pushNamed("notes");
            }
          },
        ),
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

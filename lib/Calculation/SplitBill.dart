import 'package:flutter/material.dart';

class SplitBill extends StatefulWidget {

  _SplitBill createState() => _SplitBill();

}

class _SplitBill extends State {
  final _formKey = GlobalKey<FormState>();
  final peopleController = TextEditingController();
  final amountController = TextEditingController();
  double splitAmount=0;


  _changeText(amount){

    setState(() {
      this.splitAmount=amount;
    });


  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(title: Text('Split Bill')),
        body: Align(
            alignment: Alignment.centerLeft,
            child:
            Column(

                children: <Widget>[


                  Form(
                      key: _formKey,
                      child: (
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[

                                Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 16.0)),



                                  TextFormField(
                                    keyboardType: TextInputType.number,
                                    controller: peopleController,
                                    onChanged: (value){

                                      if (_formKey.currentState.validate()) {
                                      double people = double.parse(peopleController.text);
                                      double amount = double.parse(amountController.text);

                                       splitAmount = amount/people;
                                        _changeText(splitAmount);
                                      }},
                                    decoration: const InputDecoration(
                                      icon: const Icon(Icons.people),
                                      labelText: 'No of People',
                                      hintText: 'Enter how many people to split bill',
                                    ),
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please enter how many people to split bill';
                                      }
                                      return null;
                                    },
                                  ),


                                Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 16.0)),


                                TextFormField(
                                  keyboardType: TextInputType.number,
                                  controller: amountController,
                                  onChanged: (value){

                                  if (_formKey.currentState.validate()) {
                                  double people = double.parse(peopleController.text);
                                  double amount = double.parse(amountController.text);

                                  splitAmount = amount/people;
                                  _changeText(splitAmount);
                                  }},

                                  decoration: const InputDecoration(
                                    icon: const Icon(Icons.attach_money),
                                    hintText: 'Enter Amount',
                                    labelText: 'Amount to split',


                                  ),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter amount';
                                    }
                                    return null;
                                  },
                                ),

                                Align(
                                  alignment: Alignment.center,
                                  child: Column(
                                    children: <Widget>[

                                      Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 16.0)),


                                      Text('Split Bill Amount : '+splitAmount.toStringAsFixed(1)+"0",
                                      style: TextStyle(fontSize: 18),)



                                    ],
                                  ),




                                ),







                              ]
                          )


                      )





                  )







                ]

            )


        )
    );
  }




}

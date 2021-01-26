import 'dart:async';
import 'package:flutter/material.dart';
import 'package:moneymanager/ui/views/home_view.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:loading_animations/loading_animations.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(milliseconds: 3000), () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ctx) => HomeView(),
          ));
    });

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/icons/wallet.png'),
                fit: BoxFit.scaleDown),
            gradient: LinearGradient(
                colors: [Colors.greenAccent, Colors.black],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter)),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 300,
              ),
              SizedBox(
                height: 280,
              ),
              LinearPercentIndicator(
                alignment: MainAxisAlignment.center,
                width: 240.0,
                lineHeight: 10.0,
                animation: true,
                percent: 1.0,
                animationDuration: 2300,
                backgroundColor: Colors.grey,
                progressColor: Colors.white,
              ),
              SizedBox(
                height: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  LoadingRotating.square(
                    size: 30.0,
                  ),
                  LoadingBouncingGrid.square(
                    size: 50,
                  ),
                  SizedBox(width: 30,),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

//if Router there is some error on Router
//most likely the error will popup on new flutter version
// use this
import 'package:flutter/material.dart ' hide Router;
//else use this
// import 'package:flutter/material.dart ';

import 'package:moneymanager/locator.dart';
import 'package:moneymanager/ui/router.dart';
import 'package:moneymanager/ui/shared/app_colors.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Money Manager',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: backgroundColor,
        accentColor: Colors.blue,
      ),
      initialRoute: '/',
      onGenerateRoute: Router.generateRoute,
    );
  }
}

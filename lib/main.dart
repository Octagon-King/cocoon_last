import 'package:cocoon/home_page.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'dart:async';

import './services/main_model.dart';
import 'pages/policy_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    MainModel model = MainModel();

    return ScopedModel(
      model: model,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Cocoon',
        home: HomePage(model),
        routes: <String, WidgetBuilder>{
          '/SplashScreen': (BuildContext context) => SplashScreen(),
          '/HomePage': (BuildContext context) => HomePage(model),
          '/policy_page': (BuildContext context) => PolicyPage(isPolicy: true),
        },
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _goToHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(
        "assets/splash.jpg",
        fit: BoxFit.cover,
      ),
    );
  }

  _goToHome() {
    Timer(
      Duration(seconds: 5),
      () => Navigator.of(context).pushNamedAndRemoveUntil(
        '/HomePage',
        (Route<dynamic> route) => false,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ninety_degrees/view/home.dart';
import 'package:ninety_degrees/model/constants.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primaryColor: Colors.indigo[900],
        accentColor: Colors.pinkAccent[900],
      ),
      home: new MyHomePage(title: Constants.title),
      debugShowCheckedModeBanner: false,
    );
  }
}



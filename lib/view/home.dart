import 'package:flutter/material.dart';
import 'package:ninety_degrees/view/right_angle.dart';
import 'package:ninety_degrees/model/constants.dart';
import 'package:ninety_degrees/controller/controller.dart';
import 'package:shared_preferences/shared_preferences.dart';


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  MyHomePageState createState() => new MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {

   bool _fill;


  void initState(){
    super.initState();
     fillTriangle();
  }

  //Shared Preferences
  fillTriangle() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      _fill = (preferences.getBool('fill') ?? false);//If nothing, set to false.
    });
  }

  void _selectedMenuOption(String s){
    s == Constants.license ? Controller().launchLicense(context)
        : s == Constants.about ? Controller().launchAbout(context)
        :Controller().launchSettings(context,this);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(

        title: new Text(widget.title,style: TextStyle(fontFamily: Constants.fontFamily),),
        centerTitle: true,

        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: _selectedMenuOption,
            itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
              const PopupMenuItem<String>(
                value: Constants.settings,
                child: Text(Constants.settings),
              ),
              const PopupMenuItem<String>(
                value: Constants.license,
                child: Text(Constants.license),
              ),
              const PopupMenuItem<String>(
                value: Constants.about,
                child: Text(Constants.about),
              ),
            ],
          ),
        ],
      ),
      body:RightAngle(_fill),
    );

  }
}


import 'package:flutter/material.dart';
import 'package:ninety_degrees/model/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ninety_degrees/view/home.dart';


class Settings extends StatefulWidget {


 Settings({Key key, @required this.parentState}) : super(key: key);

  //Need the state so I can update it...
  final MyHomePageState parentState;

  @override
  _SettingsState createState() => new _SettingsState();
}

class _SettingsState extends State<Settings> {

  //Variables
  bool _fill = false;

  void initState() {
    super.initState();
    _fillTriangle();

  }

  //Shared Preferences
  _fillTriangle() async {

    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      _fill = (preferences.getBool('fill') ?? false);//If nothing, set to false.
    });

  }

  //Set the Shared preference here.
  _setFill() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if(_fill == false){_fill = true;}else{_fill = false;}
    setState(() {
      preferences.setBool('fill', _fill);//If nothing, set to false.

    });

    //Updating the state...Calling method in RightTriangle..
    widget.parentState.fillTriangle();

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(Constants.settings,
          style: TextStyle(fontFamily: Constants.fontFamily),),
        centerTitle: true,),
      body: Container(
        child: Column(children: <Widget>[
          Row(children: <Widget>[
            Text(Constants.filTriangle),
            Checkbox(value: _fill,activeColor: Colors.grey[500],
              onChanged: (bool value){
                setState(() {
                  _setFill();
                });
              },
            ),
          ],
          ),

          Divider(color: Colors.black26,),


        ]),
        padding: EdgeInsets.all(20),
      ),
    );
  }

}

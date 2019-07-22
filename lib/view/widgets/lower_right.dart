import 'package:flutter/material.dart';
import 'package:ninety_degrees/controller/controller.dart';
import 'package:ninety_degrees/view/dialogs/custom_dialog.dart';
import 'package:ninety_degrees/model/constants.dart';


class LowerRight extends StatefulWidget {


  @override
  _TopRightState createState() => _TopRightState();
}

class _TopRightState extends State<LowerRight> {

  final _myControllerA = TextEditingController();
  final _myControllerB = TextEditingController();
  final _myControllerC = TextEditingController();
  final _myControllerAB = TextEditingController();
  final _myControllerBC = TextEditingController();
  final _myControllerCA = TextEditingController();
  final Controller con = Controller();



   @override
  void initState() {
    super.initState();
    _myControllerC.text = Constants.ninety;

  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    _myControllerA.dispose();
    _myControllerB.dispose();
    _myControllerC.dispose();
    _myControllerAB.dispose();
    _myControllerBC.dispose();
    _myControllerCA.dispose();

    super.dispose();
  }

  _tryAgain() async {
    return  showDialog(
      context: context,
      builder: (BuildContext context) => CustomDialog(
        title: Constants.retry,
        description: Constants.measure,
        buttonText: Constants.ok,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Spacer(),

            new Container(
                width: 100.0,
                padding: EdgeInsets.all(10),
                child: TextField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.numberWithOptions(),
                  cursorColor: Colors.black45,
                  controller: _myControllerA,

                  decoration: InputDecoration(
                      labelText: Constants.a, border: OutlineInputBorder()),
                )),
            Container(width: 10.0,),

            new Container(
                width: 100.0,
                padding: EdgeInsets.all(10),
                child: TextField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.numberWithOptions(),
                  cursorColor: Colors.black45,
                  controller: _myControllerB,
                  decoration: InputDecoration(
                      labelText: Constants.b, border: OutlineInputBorder()),
                )),
            Container(width: 10.0,),

            new Container(
                width: 100.0,
                padding: EdgeInsets.all(10),
                child: TextField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.numberWithOptions(),
                  cursorColor: Colors.black45,
                  controller: _myControllerC,
                  decoration: InputDecoration(
                      labelText: Constants.c, border: OutlineInputBorder()),
                )),
            Spacer(),
          ],
        ),
        Row(
          children: <Widget>[
            Spacer(),
            new Container(
                width: 100.0,
                padding: EdgeInsets.all(10),
                child: TextField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.numberWithOptions(),
                  cursorColor: Colors.black45,

                  controller: _myControllerAB,
                  decoration: InputDecoration(
                      labelText: Constants.ab, border: OutlineInputBorder()),
                )),
            Container(width: 10.0,),
            new Container(
                width: 100.0,
                padding: EdgeInsets.all(10),
                child: TextField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.numberWithOptions(),
                  cursorColor: Colors.black45,

                  controller: _myControllerBC,
                  decoration: InputDecoration(
                      labelText: Constants.bc, border: OutlineInputBorder()),
                )),
            Container(width: 10.0,),
            new Container(
                width: 100.0,
                padding: EdgeInsets.all(10),
                child: TextField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.numberWithOptions(),
                  cursorColor: Colors.black45,

                  controller: _myControllerCA,
                  decoration: InputDecoration(
                      labelText: Constants.ca, border: OutlineInputBorder()),
                )),
            Spacer(),
          ],
        ),
       ButtonBar(children: <Widget>[

          OutlineButton(
            child: const Text(Constants.calculate),
            textColor: Colors.deepPurple[900],
            color: Colors.deepPurple,
            highlightedBorderColor: Colors.deepPurple[300],
            borderSide: BorderSide(color: Colors.grey[500], width: 2.0),
            onPressed: () {

              if(con.calculateRight(_myControllerA.text,
                  _myControllerB.text, _myControllerAB.text,
                  _myControllerBC.text, _myControllerCA.text)){

               con.launchResults(context);
              }else{
                _tryAgain();
              }

            },
          ),
            OutlineButton(
              child: const Text(Constants.clear),
              textColor: Colors.deepPurple[900],
              color: Colors.deepPurple,
              highlightedBorderColor: Colors.deepPurple[300],
              borderSide: BorderSide(color: Colors.grey[500], width: 2.0),
              onPressed: () {
                setState(() {
                  _myControllerA.clear();
                  _myControllerB.clear();

                  _myControllerAB.clear();
                  _myControllerBC.clear();
                  _myControllerCA.clear();
                });

              },
            ),

          ],
          alignment: MainAxisAlignment.center,),

      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'my_painter.dart';
import 'package:ninety_degrees/model/constants.dart';


class RightTriangle extends StatelessWidget {

  RightTriangle(this._fill);

  final bool _fill;

  @override
  Widget build(BuildContext context) {
    return Container(padding: EdgeInsets.all(10.0),
      child:Column(children: <Widget>[

        Row(
          children: <Widget>[
            Column(children: <Widget>[
              Text(Constants.a,style: TextStyle(fontWeight: FontWeight.bold),),
              Container(
                height: 50,
                width: 70,
              ),
              Text(Constants.height,style: TextStyle(fontFamily: Constants.fontFamily),),
              Container(
                height: 50,
                width: 70,
              ),
              Text(Constants.c,style: TextStyle(fontWeight: FontWeight.bold),
              )
            ]),
            Column(children: <Widget>[
              Container(
                height: 30,

              ),
              Container(
                width: 180,
                height: 60,
                child: CustomPaint(
                  painter: MyPainter(_fill),
                  child: Container(),
                ),
              ),
              Container(height: 50,
               ),
              Text(Constants.base,style: TextStyle(fontFamily: Constants.fontFamily),),
            ],),


            Column(children: <Widget>[
              Container(
                height: 50,
              ),
              Text(Constants.hypotenuse,style: TextStyle(fontFamily: Constants.fontFamily),),
              Container(
                height: 60,
              ),
              Text(Constants.b,style: TextStyle(fontWeight: FontWeight.bold),)
            ]),
          ],
        ),

      ]),
    );
  }
}


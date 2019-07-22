import 'package:flutter/material.dart';
import 'package:ninety_degrees/view/widgets/lower_right.dart';
import 'package:ninety_degrees/view/widgets/triangle_right.dart';
import 'package:ninety_degrees/model/constants.dart';

class RightAngle extends StatelessWidget {


  RightAngle(this._fill);

  final bool _fill;

   double _getScreenSize(context){
    double size = MediaQuery.of(context).size.height;
    if(size > 900.0){
      return size / 2;
    }else if(size > 700.0){
      return size / 4;
    }else if(size > 560.0){
      return size / 5;
    }else if(size > 400.0){
      return size / 6;
    }else{
      return 50.0;
    }
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      body:SingleChildScrollView(child:Container(decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Colors.indigo[900],Colors.indigo[500]],

            begin: const FractionalOffset(0.0,0.0),
            end: const FractionalOffset(0.0, 0.5),
            stops: [0.0,1.0],
            tileMode: TileMode.clamp

        ),

      ),
        //width: MediaQuery.of(context).size.width,
        // height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(child:Column(children: <Widget>[
          Container(height: 10,),
          Card(color: Colors.white,margin: EdgeInsets.all(10.0),

            child: Column(children: <Widget>[

              Container(child:Text(Constants.top,softWrap: true,
                style: TextStyle(fontSize: 20.0),),padding: EdgeInsets.fromLTRB(20, 20, 20, 20),),

              Container(
                  padding: EdgeInsets.all(0.5),
                  child: Row(
                    children: <Widget>[Spacer(),  RightTriangle(_fill), Spacer()],
                  )),
              Container(child: LowerRight()),
              Container(padding: EdgeInsets.fromLTRB(20, 20, 20, 20),),

            ]
              ,),
          ),
          //Space at bottom of screen..
          Container(height: _getScreenSize(context),),
        ],),
        ),
        ),
      ),
    );
  }
}


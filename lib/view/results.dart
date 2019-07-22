import 'package:flutter/material.dart';
import 'package:ninety_degrees/model/triangle.dart';
import 'package:ninety_degrees/model/constants.dart';


class Results extends StatelessWidget{

  final Triangle triangle;

  Results({Key key, @required this.triangle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
        title: new Text(Constants.results,style: TextStyle(fontFamily: Constants.fontFamily),),
    centerTitle: true,),
      body:Container(child:Column(children: <Widget>[

          Row(children: <Widget>[Text(Constants.measurements,softWrap: true,
          style: TextStyle(fontSize: 20.0),),Spacer()],),


          Text(Constants.aR + Constants.colon + triangle.ag.toString(),softWrap: true,),


          Text(Constants.bR + Constants.colon + triangle.bg.toString(),softWrap: true,),

          Text(Constants.cR + Constants.colon + triangle.cg.toString(),softWrap: true,),

          Text(Constants.abr + Constants.colon + triangle.abg.toString(),softWrap: true,),

          Text(Constants.bcr + Constants.colon + triangle.bcg.toString(),softWrap: true,),

          Text(Constants.car + Constants.colon +  triangle.cag.toString(),softWrap: true,),

          Text(Constants.area + triangle.areag.toString(),softWrap: true,),

          Text(Constants.perimeter + triangle.perimeterg.toString(),softWrap: true,),

        ],mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
        ),

padding: EdgeInsets.all(20),
    ),

    );

  }
}

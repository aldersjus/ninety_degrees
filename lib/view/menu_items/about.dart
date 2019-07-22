import 'package:flutter/material.dart';
import 'package:ninety_degrees/model/constants.dart';


class About extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
    title: new Text(Constants.about,style: TextStyle(fontFamily: Constants.fontFamily),),),
      body:Container(decoration: BoxDecoration(
        gradient: LinearGradient(colors:  [Colors.indigo[900],Colors.indigo[500]],
        //[Colors.deepPurple[900],Colors.deepPurple[500]],
        begin: const FractionalOffset(0.5,0.0),
          end: const FractionalOffset(0.0, 0.5),
          stops: [0.0,1.0],
          tileMode: TileMode.clamp

        ),

      ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Card(color: Colors.white,margin: EdgeInsets.all(10.0),
          child: Container(child:Column(children:[Text(Constants.title,softWrap: true,
            style: TextStyle(fontSize: 20.0),),
          Container(height: 20,),
            Text(Constants.aboutApp)
          ]),padding: EdgeInsets.all(20),),
        ),
      ),

    );
  }
}

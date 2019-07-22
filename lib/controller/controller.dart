import 'package:ninety_degrees/model/triangle.dart';
import 'package:ninety_degrees/model/calculator.dart';
import 'package:flutter/material.dart';
import 'package:ninety_degrees/view/results.dart';
import 'package:ninety_degrees/view/menu_items/license.dart';
import 'package:ninety_degrees/view/menu_items/settings.dart';
import 'package:ninety_degrees/view/menu_items/about.dart';


class Controller{

  Triangle t;
  Calculator c;

  bool calculateRight(String a, String b, String ab, String bc, String ca){
    bool checked = false;

    List<double> list = [0,0,0,0,0,0];
    list[0] = a == '' ? 0.0 : double.parse(a);
    list[1] = b == '' ? 0.0 : double.parse(b);
    list[2] = 90.0;
    list[3] = ab == '' ? 0.0 : double.parse(ab);
    list[4] = bc == '' ? 0.0 : double.parse(bc);
    list[5] = ca == '' ? 0.0 : double.parse(ca);

    num count = 0;
    for(num i = 0; i < 6; i++){
      if(list[i] > 0.0){
        count++;
      }
    }

    if(count == 3){
      double validAngles = list[0] + list[1];//
      double validSides = list[3] + list[4] + list[5];

      if(validAngles <= 90.0){

        if(validAngles - list[0] <= 89 && validAngles - list[1] <= 89){
          if(validSides > 0.0) {
            c = Calculator(Triangle(list[0], list[1], list[2], list[3], list[4], list[5]));
            if(list[3] > 0.0 && list[4] > 0.0) {
              checked = c.calculate(true);
            }else if(list[5] > 0.0 && list[4] > 0.0) {
              checked = c.calculate(true);
            }else if(list[3] > 0.0 && list[5] > 0.0) {
              checked = c.calculate(true);
            }
            else{
              checked = c.calculate(false);
            }

            t = c.triangleResults;

          }
        }
      }
    }

    return checked;
  }

  void launchResults(context){
    Navigator.push(context, MaterialPageRoute(builder: (context) => Results(triangle: t,)));
  }

   void launchLicense(context){
    Navigator.push(context, MaterialPageRoute(builder: (context) => Licenses()));
  }

  void launchSettings(context,parentState){
    Navigator.push(context, MaterialPageRoute(builder: (context) => Settings(parentState: parentState)));
  }

  void launchAbout(context){
    Navigator.push(context, MaterialPageRoute(builder: (context) => About()));
  }


}

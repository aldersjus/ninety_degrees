import 'package:flutter/material.dart';


class MyPainter extends CustomPainter{

  MyPainter(this._fill);
  bool _fill;

  @override
  void paint(Canvas canvas, Size size){

    var paint = Paint();
    paint.color = Colors.black;
    paint.strokeWidth = 2.0;

    var path = Path();

    path.moveTo(0.0, 0.0);
    path.lineTo(size.width , 100.00);
    path.lineTo(0.0,100);
    path.close();

    if (_fill != null) {//Receives a null due to order of instantiation.
        if(_fill){
          paint.style = PaintingStyle.stroke;
          canvas.drawPath(path, paint);
          canvas.drawShadow(path, Colors.black, 5.0, true);
          path.moveTo(4.0, 4.0);
          path.lineTo(size.width - 4.0, 98.00);
          path.lineTo(4.0,98);
          path.close();
          paint.color = Colors.grey[500];
          paint.style = PaintingStyle.fill;
          canvas.drawPath(path, paint);

        }else{
          paint.style = PaintingStyle.stroke;
          canvas.drawPath(path, paint);
          canvas.drawShadow(path, Colors.black, 5.0, true);
          path.moveTo(4.0, 4.0);
          path.lineTo(size.width - 4.0, 98.00);
          path.lineTo(4.0,98);
          path.close();
          paint.color = Colors.white;
          paint.style = PaintingStyle.fill;
          canvas.drawPath(path, paint);
        }
    } else {
      //if null paint like this...
      paint.style = PaintingStyle.stroke;
      canvas.drawPath(path, paint);
      canvas.drawShadow(path, Colors.black, 5.0, true);
      path.moveTo(4.0, 4.0);
      path.lineTo(size.width - 4.0, 98.00);
      path.lineTo(4.0, 98);
      path.close();
      paint.color = Colors.grey[500];
      paint.style = PaintingStyle.fill;
      canvas.drawPath(path, paint);
    }

  }

  @override
  bool shouldRepaint(CustomPainter cp){
    return false;
  }
}
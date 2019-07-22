import 'triangle.dart';
import 'dart:math';


class Calculator{

  Triangle _triangle;

  Triangle get triangleResults => _triangle;

  Calculator(Triangle t){
    this._triangle = t;
  }

  bool calculate(twoSides){
    //Check these to ensure measurements add up.
    bool solvedAngles = false;
    bool solvedSides = false;

    if(twoSides){
      solvedSides = _solveSides();
      solvedAngles = _solveAngles();
    }else {
      if (_triangle.abg != 0.0) {
        solvedAngles = _solveAngles();
        solvedSides = _solveSidesFromAngles();
      }
      else if (_triangle.bcg != 0.0) {
        solvedAngles = _solveAngles();
        solvedSides = _solveSidesFromAngles();
      }
      else {
        solvedAngles = _solveAngles();
        solvedSides = _solveSidesFromAngles();
      }
    }

    _triangle.perimeter = _findPerimeter(_triangle.bcg, _triangle.cag, _triangle.abg);
    _triangle.area = _findArea(_triangle.bcg, _triangle.cag);

    return solvedSides == solvedAngles;
  }
  //solve sides from angles
  bool _solveSidesFromAngles(){
    bool solvedSides = false;

    //if got hyp
    if(_triangle.abg != 0.0){
      _triangle.ca = _findCAH(_triangle.ag, _triangle.abg);
      _triangle.bc = _findMissingSide(_triangle.abg, _triangle.cag);
      solvedSides = true;
    }
    //if got base
    else if(_triangle.bcg != 0.0){
      _triangle.ca = _findTOA(_triangle.bg, _triangle.bcg);
      _triangle.ab = _hypotenuseIs(_triangle.bcg, _triangle.cag);
      solvedSides = true;

    }

    //if got height
    else if(_triangle.cag != 0.0){
      _triangle.ab = _findSOH(_triangle.bg, _triangle.cag);
      _triangle.bc = _findMissingSide(_triangle.abg, _triangle.cag);
      solvedSides = true;
    }

    return solvedSides;
  }

  //solve sides
  bool _solveSides(){
    bool solvedSides = false;
    //Check if ok or solve sides.
    if(_triangle.abg != _hypotenuseIs(_triangle.bcg, _triangle.cag)){
      if(_triangle.bcg > 0.0 && _triangle.cag > 0.0){
        _triangle.ab = _hypotenuseIs(_triangle.bcg, _triangle.cag);
        solvedSides = true;
      }

      if(_triangle.bcg > 0.0){
        if(_triangle.abg > 0.0){
          _triangle.ca = _hypotenuseReversedBase(_triangle.abg, _triangle.bcg);
          solvedSides = true;
        }

      }

      if(_triangle.cag > 0.0){
        if(_triangle.abg > 0.0){
          _triangle.bc = _hypotenuseReversedHeight(_triangle.abg, _triangle.cag);
          solvedSides = true;
        }
      }
    }else{
      solvedSides = true;
    }
    return solvedSides;
  }

  //solve angles
  bool _solveAngles(){
    bool solvedAngles = false;
    //Check and if possible calculate angles.
    if(_triangle.ag + _triangle.bg + _triangle.cg != 180.0){
      if(_triangle.ag > 0.0 && _triangle.bg == 0.0){
        _triangle.b = _missingAngleIs(_triangle.ag);
        solvedAngles = true;
      }


      else if(_triangle.bg > 0.0 && _triangle.ag == 0.0) {
        _triangle.a = _missingAngleIs(_triangle.bg);
        solvedAngles = true;
      }


      else if(_triangle.ag == 0){
        _triangle.a = _callNegativeCAH(_triangle.cag, _triangle.abg);
        _triangle.b = _missingAngleIs(_triangle.ag);
        solvedAngles = true;
      }
    }else{
      solvedAngles = true;
    }
    return solvedAngles;
  }

  //angles
  double _missingAngleIs(angle){
    return 180 - 90 - angle;
  }

  double _callNegativeCAH(adjacent, hypotenuse){
    //returns radians
    return acos(adjacent/hypotenuse)*(180/pi);
  }

  double _findCAH(angle, hyp){
    return cos((angle * pi) / 180) * hyp;
  }


  double _findSOH(angle, opposite){
    return opposite / sin((angle * pi) / 180);
  }

  double _findTOA(angle, adjacent ){
    return tan((angle * pi) / 180) * adjacent;
  }

 //sides
  double _hypotenuseIs(base, height){
    return sqrt((base * base) + (height * height));
  }

  double _hypotenuseReversedHeight(hypo, height){
    return sqrt((hypo * hypo) - (height * height));
  }

  double _hypotenuseReversedBase(hypo, base){
    return sqrt((hypo * hypo) - (base * base));
  }


  //missing side
  double _findMissingSide(hypo, side){
    return sqrt(hypo * hypo - side * side);
  }
  //perimeter
  double _findPerimeter(base, height, hypotenuse){
    return (base + height + hypotenuse);
  }
  //area
  double _findArea(base, height){
    return  ((base * height) / 2);
  }



}
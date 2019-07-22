class Triangle{

  //angles
  num _a,_b,_c;
  //sides
  num _ab,_bc,_ca;
  //other
  num _perimeter = 0.0, _area = 0.0;

  Triangle(a,b,c,ab,bc,ca){
    this._a = a;
    this._b = b;
    this._c = c;
    this._ab = ab;
    this._bc = bc;
    this._ca = ca;

  }



  num get ag => _a;

  num get bg => _b;

  num get cg => _c;

  num get abg => _ab;

  num get bcg => _bc;

  num get cag => _ca;

  num get areag => _area;

  num get perimeterg => _perimeter;

  set area(value) {
    _area = value;
  }

  set perimeter(num value) {
    _perimeter = value;
  }

  set a(num value) {
    _a = value;
  }

  set b(value) {
    _b = value;
  }

  set c(value) {
    _c = value;
  }

  set ca(value) {
    _ca = value;
  }

  set ab(num value) {
    _ab = value;
  }

  set bc(value) {
    _bc = value;
  }


}
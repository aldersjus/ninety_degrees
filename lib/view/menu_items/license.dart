import 'package:flutter/material.dart';
import 'package:ninety_degrees/model/constants.dart';

class Licenses extends StatefulWidget {

  @override
  _LicensesState createState() => _LicensesState();
}

// Define a corresponding State class.
class _LicensesState extends State<Licenses> {

  @override
  Widget build(BuildContext context) {
    return new SafeArea(child:new Scaffold(
      body: LicensePage(applicationLegalese:Constants.legal,
        applicationName: Constants.title,
        applicationVersion: Constants.version,),
    ),
    );
  }
}
import 'package:bmi_app/presentations/screen/bmi_calculator_screen.dart';
import 'package:bmi_app/presentations/screen/bmi_result_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class AppRoute{
  Route?generateRoute(RouteSettings settings){
    switch(settings.name){
      case "/bmi_calculator":
        return  MaterialPageRoute(builder: (_)=>BmiCalculator());
      case "/bmi_result":
        return  MaterialPageRoute(builder: (_)=>BmiResult());
      default:
        return  MaterialPageRoute(builder: (_)=>BmiCalculator());
    }
  }
}
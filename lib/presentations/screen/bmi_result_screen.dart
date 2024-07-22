import 'dart:math';

import 'package:bmi_app/bloc_app/bloc.dart';
import 'package:bmi_app/bloc_app/state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BmiResult extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BlocApp, AppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var Result = BlocApp.get(context).weight / pow(BlocApp.get(context).number / 100, 2);

        return Scaffold(
          appBar: AppBar(
            title: Text("BMI RESULT"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Gender: ${BlocApp.get(context).isMale ? "MALE" : "FAMALE"}", style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                ),),
                Text("Result:${Result.round()}"
                  , style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                  ),),
                Text("Age:${BlocApp.get(context).age}", style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                ),),
              ],
            ),
          ),
        );
      },
    );
  }
}
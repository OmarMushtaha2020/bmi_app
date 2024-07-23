import 'package:bmi_app/bloc_app/bloc.dart';
import 'package:bmi_app/shared/route/app_route.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() =>
    runApp(
      DevicePreview(
        builder: (context) =>
            BlocProvider(
              create: (context) => BlocApp(),

              child: MyApp(),
            ), // Wrap your app
      ),
    );


class MyApp extends StatelessWidget {
  AppRoute appRoute = AppRoute();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: DevicePreview.appBuilder,
      onGenerateRoute: appRoute.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}

// home: AnimatedSplashScreen(splashIconSize: double.infinity,splash:
// Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Image(image: AssetImage("assets/image/bmi.png"),height: 100,),
//
// Padding(
// padding: const EdgeInsets.only(top: 10),
// child: Text("Bmi Calculator",style: TextStyle(
// fontSize: 18,
// fontWeight: FontWeight.bold
// ),),
// )
// ],
// )
// , nextScreen: Bmi_Calculator(),
// splashTransition: SplashTransition.sizeTransition,
//
// ),

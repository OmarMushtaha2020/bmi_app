import 'package:bmi_app/bloc_app/bloc.dart';
import 'package:bmi_app/shared/bloc_observer/bloc_observer.dart';
import 'package:bmi_app/shared/route/app_route.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart'; // Import the sizer package

void main() {
  Bloc.observer = BlocObserverToApp();

  runApp(
    DevicePreview(
      builder: (context) =>
          BlocProvider(
            create: (context) => BlocApp(),

            child: MyApp(),
          ), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  AppRoute appRoute = AppRoute();

  @override
  Widget build(BuildContext context) {
    return Sizer( // Wrap your MaterialApp with Sizer
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          builder: DevicePreview.appBuilder,
          onGenerateRoute: appRoute.generateRoute,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}

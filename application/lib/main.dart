import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:CovidInfo/ui/util/app_routes.dart';
import 'package:CovidInfo/ui/pages/home_navigator.dart';

import 'package:CovidInfo/ui/pages/home_screen.dart';
import 'package:CovidInfo/ui/pages/virus_screen.dart';
import 'package:CovidInfo/ui/pages/about_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return MaterialApp(
      title: 'CovidInfo',
      initialRoute: Routes.homePageNavigator,
      debugShowCheckedModeBanner: false,
      routes: {
        Routes.homePageNavigator: (context) => HomeNavigator(),
        Routes.homePage: (context) => HomeScreen(),
        Routes.virusPage: (context) => VirusScreen(),
        Routes.aboutPage: (context) => AboutScreen()
      },
    );
  }
}

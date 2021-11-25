import 'package:flutter/material.dart';
import 'package:mushroom_project_final_year/routing.dart';
import 'package:mushroom_project_final_year/splashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mushroom ',
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}

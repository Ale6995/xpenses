import 'package:flutter/material.dart';
import 'package:xpenses_app/screens/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Xpenses',
      theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.blueGrey,
          accentColor: Colors.black),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: SplashScreen(),
      themeMode: ThemeMode.system,
    );
  }
}

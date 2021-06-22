import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xpenses_app/screens/splash/splash.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Xpenses',
      theme: ThemeData(
          fontFamily: 'aileron',
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

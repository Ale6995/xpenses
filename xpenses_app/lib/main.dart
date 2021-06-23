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
          primaryColor: Colors.blue[100],
          highlightColor: Colors.blue[100],
          accentColor: Colors.purple,
          secondaryHeaderColor: Colors.blue,
          backgroundColor: Colors.white,
          cardColor: Colors.red[100],
          focusColor: Colors.green[100]),
      darkTheme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: 'aileron',
          accentColor: Colors.grey[400],
          secondaryHeaderColor: Colors.lime[200],
          highlightColor: Colors.grey[600],
          cardColor: Colors.pink[100],
          focusColor: Colors.teal[200]),
      home: SplashScreen(),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
    );
  }
}

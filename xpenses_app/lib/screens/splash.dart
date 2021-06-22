import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:xpenses_app/screens/tapBar/tapBar.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => MyTabBar(),
      ));
    });
    return Container(
      color: Colors.white,
      child: Image.asset('images/walletG.gif'),
    );
  }
}

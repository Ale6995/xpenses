import 'dart:ui';

import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 5), () {
      print('Holi');
    });
    return Container(
      color: Colors.white,
      child: Image.asset('images/walletG.gif'),
    );
  }
}

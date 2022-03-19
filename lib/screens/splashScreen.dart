import 'package:answers/screens/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

class CevappSplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: AnimatedSplashScreen(
            splash: 'assets/Cevapp.png',
            splashIconSize: 1000,
            nextScreen: CevappHomePage(),
            backgroundColor: Color(0xFF233DFF)));
  }
}

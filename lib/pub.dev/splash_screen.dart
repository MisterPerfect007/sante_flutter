import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:sante_app/screens/home.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: 'assets/splash.png',
      splashIconSize: 200,
      duration: 5000,
      backgroundColor: Colors.green.shade100,
      nextScreen: Home(),
      splashTransition: SplashTransition.scaleTransition,
      animationDuration: Duration(seconds: 1),
      
    );;
  }
}
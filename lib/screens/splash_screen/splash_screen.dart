import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_app/screens/home_screen/home_screen.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "splash";
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    });
    return Container(
      color: Colors.white,
      child: const Stack(
        children: [
          Image(image: AssetImage("assets/images/pattern.png"),fit: BoxFit.cover,),

          Center(child: Image(image: AssetImage("assets/images/logo.png"),))
        ],
      ),
    );
  }
}

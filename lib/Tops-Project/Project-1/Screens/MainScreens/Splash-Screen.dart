import 'dart:async';

import 'package:flutter/material.dart';

import 'HomePage.dart';

class Splash extends StatefulWidget {

  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(gradient: RadialGradient(
                colors: [Colors.white, Colors.deepPurpleAccent])),
            child: Image.asset(
              'assets/images/Splash.png', fit: BoxFit.contain,)),
      ),
    );
  }
}

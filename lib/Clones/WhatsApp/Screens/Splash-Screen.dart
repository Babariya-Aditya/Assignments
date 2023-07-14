import 'dart:async';

import 'package:assignment_1/Clones/WhatsApp/Screens/Home.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen())); });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff131C2C),
      body: Center(
        child: Container(child: Image.asset('assets/images/whatsapp-128.ico')),
      ),
    );
  }
}

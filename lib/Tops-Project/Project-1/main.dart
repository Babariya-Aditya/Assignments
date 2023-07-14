import 'package:assignment_1/Tops-Project/Project-1/Screens/MainScreens/HomePage.dart';
import 'package:assignment_1/Tops-Project/Project-1/Screens/MainScreens/Splash-Screen.dart';
import 'package:flutter/material.dart';

import 'Screens/Login-Page.dart';
import 'Screens/onboarding/on_boarding.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData(
        inputDecorationTheme: const InputDecorationTheme(
          labelStyle: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500),
            border: OutlineInputBorder(
                borderSide: BorderSide(width: 3, color: Colors.black)),
            enabledBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.black),
                gapPadding: 5),
          hintStyle: TextStyle(color: Colors.black)
        ),
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.indigo,
      ),
      home: onboarding(),
    );
  }
}



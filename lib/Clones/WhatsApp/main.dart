import 'package:assignment_1/Clones/WhatsApp/Screens/Chats/Chat-Screen.dart';
import 'package:assignment_1/Clones/WhatsApp/Screens/Splash-Screen.dart';
import 'package:flutter/material.dart';

import 'Screens/Community-Screen.dart';
import 'Screens/Home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: SplashScreen(),
    );
  }
}
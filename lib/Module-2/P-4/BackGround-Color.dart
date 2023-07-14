import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      title: 'Material App',
      home: HomePage()
    );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color colorss=Colors.red;
  var color=[Colors.purple,Colors.cyan,Colors.blue,Colors.brown,Colors.indigo,Colors.pink,Colors.yellow];
  int i=Random().nextInt(6);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: colorss,
      appBar: AppBar(
        title: Text('Material App Bar'),
      ),
      body: Center(
        child: Container(
          child: ElevatedButton(child: Text("Press"),onPressed:() {
           setState(() {
             colorss=color[i];
           });

          }, ),



        ),
      ),
    );
  }
}


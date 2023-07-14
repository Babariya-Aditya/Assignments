import 'package:flutter/material.dart';

class SecondPAge extends StatefulWidget {
  int result;
  SecondPAge(this.result);

  @override
  State<SecondPAge> createState() => _SecondPAgeState(this.result);
}

class _SecondPAgeState extends State<SecondPAge> {
  final int? result;
  _SecondPAgeState(this.result);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Result is $result"),

    );
  }
}

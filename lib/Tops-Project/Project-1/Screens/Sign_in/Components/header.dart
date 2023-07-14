import 'package:flutter/material.dart';

class LayoutHeader extends StatelessWidget {
  const LayoutHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: SafeArea(
      child: Column(children: [
        AspectRatio(aspectRatio: 3/2,child: Image.asset('assets/images/login (2).png',)),
        SizedBox(height: 16,),
        Text("Welcome Back",style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
      ]),
    ),);
  }
}

import 'package:flutter/material.dart';

class Header extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
    Container(
    padding: EdgeInsets.all(8),
    child: Column(children: [
    Row(
    children: [
    IconButton(
    onPressed: () {
    Navigator.pop(context);
    },
    icon: Icon(
    Icons.arrow_back_ios_new_sharp,
    size: 25,
    )),

    ],
    ),
    SizedBox(
    height: 20,
    ),
    Text(
    "Register Account",
    style: TextStyle(fontSize: 26,fontWeight:FontWeight.bold),
    ),
    SizedBox(
    height: 20, ),
    Text(
    "Complete all the details or continue \n              with social media",
    style: TextStyle(fontSize: 18),
    ),
    ],
    ),
    ),
  ]
    );
  }
}

import 'package:flutter/material.dart';

Widget getindicator(bool require){
  return Container(
    height: require?12:10,
    width: require?12:10,

    margin: EdgeInsets.symmetric(horizontal: 3),
    decoration: BoxDecoration(color: require?Colors.indigoAccent:Colors.grey,borderRadius: BorderRadius.circular(require?12:10)),



  );
}
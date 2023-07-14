import 'package:flutter/material.dart';

class Items{
  TextFormField getFormField({String? label,String? Hint,IconData? iconData,double? size,double? edge}){
    return TextFormField(obscureText: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(edge!
              )),
          labelText: label,
          labelStyle: TextStyle(fontSize: size),
          suffixIcon: Icon(iconData,size: 30,color: Colors.grey,)),
    );
  }
}
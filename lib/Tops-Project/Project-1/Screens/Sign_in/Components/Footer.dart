import 'package:flutter/material.dart';

import '../../Register-Acc.dart';
import '../../Signup/Sign_up.dart';

class LayoutFooter extends StatelessWidget {
  const LayoutFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Text(
        "Don't have an account?",
        style: TextStyle(fontSize: 16,),
      ),
      SizedBox(width: 8),
      TextButton(onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Signup(),));
      },
        child: Text(" Sign Up", style: TextStyle(fontSize: 17,
            color: Colors.deepPurpleAccent.shade400,
            fontWeight: FontWeight.bold))),
        ],
      ),
    );
  }
}

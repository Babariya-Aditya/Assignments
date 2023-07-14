import 'package:assignment_1/Tops-Project/Project-1/Modal/onboarding.dart';
import 'package:flutter/material.dart';

class Sliderview extends StatelessWidget {
  Item item;
  Sliderview(this.item);




  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              item.title,
              style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),

            ),
            SizedBox(height: 10,),
            AspectRatio(aspectRatio: 16/12,child: Image.asset(item.image)),

            SizedBox(height: 10,),
            Text(style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),item.desc),
          ],
        ),
      ),
    );
  }
}

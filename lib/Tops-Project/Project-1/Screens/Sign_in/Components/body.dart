import 'package:assignment_1/Tops-Project/Project-1/Screens/Sign_in/Components/header.dart';
import 'package:flutter/material.dart';

import 'Footer.dart';
import 'Sign_in_Form.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            reverse: true,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  minHeight: constraints.maxHeight
              ),
              child: IntrinsicHeight(
                child: Padding(

                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      LayoutHeader(),
                      SizedBox(height: 24,),
                      Sigin(),
                      SizedBox(height: 35,),
                      LayoutFooter(),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

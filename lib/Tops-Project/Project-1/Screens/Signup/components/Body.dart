import 'package:flutter/material.dart';

import 'Signup_Form.dart';
import 'header.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Header(),
            SizedBox(
              height: 20,
            ),
            SigupForm()

          ],
        ),
      ),
    );
  }
}

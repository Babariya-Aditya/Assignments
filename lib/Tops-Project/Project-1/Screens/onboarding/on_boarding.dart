import 'package:flutter/material.dart';

import '../../Modal/onboarding.dart';
import 'Components/body.dart';

class onboarding extends StatefulWidget {
  const onboarding({super.key});

  @override
  State<onboarding> createState() => _onboardingState();
}



class _onboardingState extends State<onboarding> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body()

    );
  }
}

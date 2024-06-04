import 'package:flutter/material.dart';
import 'package:project1/Project_Implementation/constants.dart';

class header extends StatelessWidget {
  const header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Register Account",
          style: Constants.headerstyle,
        ),
        SizedBox(
          height: 8,
        ),
        const Text(
          "Complete your details or continue\nwith social media",
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

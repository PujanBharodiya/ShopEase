import 'package:flutter/material.dart';
import 'package:project1/Project_Implementation/routes/approute.dart';

class footer extends StatelessWidget {
  const footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don\'t have an account?"),
        TextButton(onPressed: () {
          Navigator.pushNamed(context, approute.signout);
        }, child: Text("Sign Up")),

      ],
    );
  }
}

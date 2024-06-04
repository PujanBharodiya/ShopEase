import 'package:flutter/material.dart';
import 'package:project1/Project_Implementation/screens/SigInScreen/Components/Body.dart';

class sinInBody extends StatefulWidget {
  const sinInBody({Key? key}) : super(key: key);

  @override
  State<sinInBody> createState() => _sinInBodyState();
}

class _sinInBodyState extends State<sinInBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}

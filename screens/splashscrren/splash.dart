import 'package:flutter/material.dart';
import 'package:project1/Project_Implementation/screens/splashscrren/components.dart';

class splashScreen extends StatelessWidget {
  const splashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: components(),
    );
  }
}
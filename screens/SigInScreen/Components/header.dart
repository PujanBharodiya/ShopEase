import 'package:flutter/material.dart';
import 'package:project1/Project_Implementation/constants.dart';

class header extends StatelessWidget {
  const header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/Images1/i1.jpg',height: 100,width: 100,),
              SizedBox(height: 16,),
              Text("Welcome back", style: Constants.headerstyle,),
              SizedBox(height: 08,),
              Text("Sigin with your email and password", textAlign: TextAlign.center,),

            ],
          )
      ),
    );
  }
}

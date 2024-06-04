import 'package:flutter/material.dart';
import 'package:project1/Project_Implementation/screens/homepage/component/homeScreen_Drawer.dart';
import 'package:project1/Project_Implementation/screens/homepage/component/homepage.dart';
import 'package:project1/Project_Implementation/screens/homepage/component/homepage_newbody.dart';

class homepage_fuck extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: homepage_newbody(),
      drawer: homeScreen_Drawer(),
    );
  }
}

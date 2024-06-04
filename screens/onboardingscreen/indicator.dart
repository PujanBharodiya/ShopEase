import 'package:flutter/material.dart';

Widget getindicator(bool isActive){
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 03),
    height: isActive ? 14 : 10,
    width: isActive ? 14 : 10,
    decoration: BoxDecoration(
      color: isActive ? Colors.amberAccent : Colors.grey,
      borderRadius: BorderRadius.circular(10),
    ),
  );
}
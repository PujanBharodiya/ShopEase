import 'package:flutter/material.dart';
import 'package:project1/Project_Implementation/screens/homepage/component/layout_header.dart';

class homepage_newbody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
        children: [
          layout_header()
        ],
        ),
      ),
    );
  }
}

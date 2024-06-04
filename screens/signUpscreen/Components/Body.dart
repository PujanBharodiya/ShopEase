import 'package:flutter/material.dart';
import 'package:project1/ProfileUIPratice/Screens/appbar.dart';
import 'package:project1/Project_Implementation/screens/signUpscreen/Components/header.dart';
import 'package:project1/Project_Implementation/screens/signUpscreen/Components/sign_up.dart';

class body extends StatelessWidget {
  const body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            AppBar(),
            header(),
            SizedBox(height: 24,),
            sign_out_field(),

          ],
        ),
    );
  }
}

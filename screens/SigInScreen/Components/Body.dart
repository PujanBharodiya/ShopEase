import 'package:flutter/material.dart';
import 'package:project1/Project_Implementation/screens/SigInScreen/Components/footer.dart';
import 'package:project1/Project_Implementation/screens/SigInScreen/Components/header.dart';
import 'package:project1/Project_Implementation/screens/SigInScreen/Components/sign_in_foam.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: LayoutBuilder(
        builder: (context, constraints)
    {
      return SingleChildScrollView(
        reverse: true,
        child: ConstrainedBox(
            constraints: BoxConstraints(
                minHeight: constraints.maxHeight
            ),
            child: IntrinsicHeight(
            child : Padding(
            padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            header(),
            SizedBox(height: 24,),
            sign_in_foam(),
            SizedBox(height: 24,),
            footer(),
          ],
        ),
            ),
            ),
        ),
      );
    },
        ),
    );
  }
}


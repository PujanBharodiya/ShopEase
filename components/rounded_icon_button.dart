import 'package:flutter/material.dart';

class rounded_icon_button extends StatelessWidget {
  IconData iconData;
  VoidCallback onpress;


  rounded_icon_button({required this.iconData, required this.onpress});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 40,
      child: MaterialButton(
        onPressed: onpress,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),

        ),
        padding: EdgeInsets.all(0),
        color: Colors.white,
        child: Icon(
          iconData, color: Colors.black45,
        ),

      ),
    );
  }
}

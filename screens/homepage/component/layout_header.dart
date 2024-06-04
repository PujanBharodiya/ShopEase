import 'package:flutter/material.dart';
import 'package:project1/Project_Implementation/components/rounded_icon_button.dart';
import 'package:project1/Project_Implementation/screens/homepage/component/search_field.dart';

class layout_header extends StatelessWidget {
  const layout_header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        rounded_icon_button(
          iconData: Icons.menu_outlined,
          onpress:  () {
            Scaffold.of(context).openDrawer();
          },
        ),
        SizedBox(width: 10,),

        Expanded(child: search_field()),

        SizedBox(width: 10,),

        rounded_icon_button(
          iconData: Icons.shopping_cart,
          onpress: () {
            print("cart icons printed");
          },
        )

      ],
    );
  }
}

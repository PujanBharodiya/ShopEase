import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class search_field extends StatelessWidget {
  const search_field({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black38.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        textInputAction: TextInputAction.search,
        textAlign: TextAlign.left,
        decoration: InputDecoration(
          hintText: "Search Product",
          prefixIcon: Icon(Icons.search),
            contentPadding: EdgeInsets.symmetric(horizontal: 20 , vertical: 12)
        ),
      ),
    );
  }
}

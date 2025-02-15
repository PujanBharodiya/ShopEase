import 'package:flutter/material.dart';
import 'package:project1/Project_Implementation/model/itemlist.dart';

class slideviw extends StatelessWidget {

  Item item;

  slideviw(this.item);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AspectRatio(
            aspectRatio: 16 / 14,
            child: Image.asset(item.image),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            item.title,
            style: const TextStyle(
                color: Colors.black, fontSize: 26, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            item.desc,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade700,
            ),
          ),
        ],
      ),
    );
  }
}

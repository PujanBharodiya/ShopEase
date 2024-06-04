import 'package:flutter/material.dart';
import 'package:project1/Project_Implementation/screens/productScreen/components/Body.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product Screen"),),
      body: Body(),
    );
  }
}

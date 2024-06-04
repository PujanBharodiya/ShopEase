import 'package:flutter/material.dart';
import 'package:project1/Project_Implementation/screens/productList/components/body.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ProductListScreen"),),
      body: Body(),
    );
  }
}

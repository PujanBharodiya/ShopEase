import 'package:flutter/material.dart';
import 'package:project1/Project_Implementation/model/category.dart';
import 'package:project1/Project_Implementation/screens/categaory/components/body.dart';

class categaoryes extends StatelessWidget {
  Category?  category;


  categaoryes(this.category);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(category == null ? "Add Category" : "Update Category"),),
      body: body_categaory(category),
    );
  }
}

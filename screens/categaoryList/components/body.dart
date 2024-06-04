import 'package:flutter/material.dart';
import 'package:project1/Project_Implementation/routes/approute.dart';
import 'package:project1/Project_Implementation/screens/categaoryList/categaory_list_screen.dart';

class categaoryListScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Category List'),),
      body: categaory_body(),
    );
  }
}

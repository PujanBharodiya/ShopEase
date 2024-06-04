import 'package:flutter/material.dart';
import 'package:project1/Project_Implementation/Database/db_helper.dart';
import 'package:project1/Project_Implementation/model/category.dart';
import 'package:project1/Project_Implementation/routes/approute.dart';

class categaory_body extends StatefulWidget {

  @override
  State<categaory_body> createState() => _categaory_bodyState();
}

class _categaory_bodyState extends State<categaory_body> {

  var categoryList = <Category>[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategoryList();
  }

  DbHelper db_helper = DbHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
      var category = await Navigator.pushNamed(context, approute.categaoryy);
      if(category is Category){
        setState(() {
          categoryList.add(category);
        });
      }
    },
    child: const Icon(Icons.add, color: Colors.white,),
    ),
      body :  ListView.builder(itemCount: categoryList.length,itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            Navigator.pushNamed(context, approute.categaoryy, arguments: categoryList[index]);
          },

          leading: CircleAvatar(
            backgroundColor: Colors.amber.shade200,
            child: const Icon(
              Icons.menu_outlined,color: Colors.amber,
            ),
          ),

          title: Text(categoryList[index].title!),

          subtitle: Text(categoryList[index].description!),
        );
      },),
    );
  }

  Future<void> getCategoryList() async {
    var list = await db_helper.getCategoryList();
    setState(() {
      categoryList = list;
    });
  }
}

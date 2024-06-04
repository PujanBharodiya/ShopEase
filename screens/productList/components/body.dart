import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:project1/Project_Implementation/model/category.dart';
import 'package:project1/Project_Implementation/model/product.dart';
import 'package:project1/Project_Implementation/routes/approute.dart';
import 'package:project1/pages/Listview.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {

  DatabaseReference mref = FirebaseDatabase.instance.ref();
  List<Product> productlist = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, approute.productScreen);
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: StreamBuilder(
        stream: mref.child('product-node').onValue,
        builder: (context, snapshot) {
          if(snapshot.hasData){
            print(snapshot.data!.snapshot.value);
            Map<dynamic,dynamic> map = snapshot.data!.snapshot.value as Map;
            map.values.forEach((map) {
              productlist.add(Product.fromMap(map));
            });
            return ListView.builder(itemCount: productlist.length,itemBuilder: (context, index) {
              return ListTile(
                leading: Icon(Icons.person),
                title: Text(productlist[index].title),
                subtitle: Text(productlist[index].description),



              );
            },);
          } else if (snapshot.hasError) {
            return Center(child: Text('something went wrong'));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

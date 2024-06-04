import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project1/Project_Implementation/firebase/firebase.dart';
import 'package:project1/Project_Implementation/routes/approute.dart';

class homeScreen_Drawer extends StatelessWidget {
  const homeScreen_Drawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          buildUserAccountHeader(),
          ListTile(
            leading: Icon(Icons.add_box),
            title: Text('Manage Category'),
            onTap: () {
              Navigator.pushNamed(context, approute.categaorylistscreenn);
            },
          ),
          ListTile(
            leading: Icon(Icons.add_box),
            title: Text('Manage Product'),
            onTap: () {
              Navigator.pushNamed(context, approute.productListScreen);
            },
          ),
          Divider(
            color: Colors.grey.shade400,
          ),
          ListTile(
            onTap: () {
              Firebase_Services services = Firebase_Services();
              services.logout().then((value) {
                Navigator.pushNamedAndRemoveUntil(context,approute.sigin, (route) => false);

              },);
            },
            leading: Icon(Icons.logout),
            title: Text("Log Out"),
          )
        ],
      ),
    );
  }

  buildUserAccountHeader() {
    return UserAccountsDrawerHeader(
      accountName: Text('Tops Technologies', style: TextStyle(color: Colors.white),),
      accountEmail: Text('topstechnologies@gmail.com',style: TextStyle(color: Colors.white),),
      margin: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: Colors.green,
      ),
      currentAccountPicture: CircleAvatar(
        backgroundColor: Colors.white,
        child: Image.asset('assets/Images1/i1.jpg', height: 45, width: 45,),
      ),
    );
  }
}

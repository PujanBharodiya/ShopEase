import 'package:flutter/material.dart';
import 'package:project1/Project_Implementation/prefernce/pref_utiles.dart';
import 'package:project1/Project_Implementation/routes/approute.dart';

class homepage extends StatelessWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Home page"),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: () {
              pref_utiles.logout().then((value){
                if(value){
                  Navigator.pushNamedAndRemoveUntil(context, approute.sigin, (route) => false);
                }
              });

            }, child: Text("Log Out")),

          ],
        ),
      ),
    );
  }
}

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project1/Project_Implementation/constants.dart';
import 'package:project1/Project_Implementation/prefernce/pref_utiles.dart';
import 'package:project1/Project_Implementation/routes/approute.dart';
import 'package:project1/Project_Implementation/screens/onboardingscreen/slideview.dart';

class components extends StatefulWidget {

  @override
  State<components> createState() => _componentsState();
}

class _componentsState extends State<components> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 02), () {
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user != null) {
          // login
          Navigator.pushReplacementNamed(context, approute.homepage_neww);
        }
        else {
          if (pref_utiles.getOnboardingScreenStatus()) {
            Navigator.pushReplacementNamed(context, approute.sigin);
          } else {
            Navigator.pushReplacementNamed(context, approute.onbording);
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: Constants.backgroundgradient
            ),

          )
        ],
      ),
    );
  }
}







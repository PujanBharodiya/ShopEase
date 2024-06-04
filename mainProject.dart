import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project1/Project_Implementation/prefernce/pref_utiles.dart';
import 'package:project1/Project_Implementation/routes/approute.dart';
import 'package:project1/Project_Implementation/theme.dart';
main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await pref_utiles.init();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: apptheme(),
      title: 'Material App',
      initialRoute: approute.splash,
      onGenerateRoute: approute.generateRoute,
    );
  }
}

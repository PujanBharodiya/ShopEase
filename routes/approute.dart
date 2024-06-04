import 'package:flutter/material.dart';
import 'package:project1/Project_Implementation/model/category.dart';
import 'package:project1/Project_Implementation/screens/SigInScreen/siginBody.dart';
import 'package:project1/Project_Implementation/screens/categaory/categaory.dart';
import 'package:project1/Project_Implementation/screens/categaoryList/components/body.dart';
import 'package:project1/Project_Implementation/screens/homepage/body.dart';
import 'package:project1/Project_Implementation/screens/homepage/component/homepage_newbody.dart';
import 'package:project1/Project_Implementation/screens/onboardingscreen/Body.dart';
import 'package:project1/Project_Implementation/screens/onboardingscreen/slideview.dart';
import 'package:project1/Project_Implementation/screens/productList/product_list_screen.dart';
import 'package:project1/Project_Implementation/screens/productScreen/product_screen.dart';
import 'package:project1/Project_Implementation/screens/signUpscreen/signup_screen.dart';
import 'package:project1/Project_Implementation/screens/splashscrren/components.dart';
import 'package:project1/Project_Implementation/screens/splashscrren/splash.dart';
class approute{
  static const splash = '/splash';
  static const onbording = '/onbording';
  static const sigin = '/signin';
  static const signout = '/signout';
  static const homepage_neww = '/homepage_neww';
  static const categaorylistscreenn = '/categaoryList';
  static const categaoryy = '/categaory';
  static const productListScreen = '/productListScreen';
  static const productScreen = '/productScreen';

  static Route<dynamic>? generateRoute(RouteSettings settings){
    switch(settings.name) {
      case splash:
        return MaterialPageRoute(builder: (context) => splashScreen() );
      case onbording:
        return MaterialPageRoute(builder: (context) => Body() ,);
      case sigin:
        return MaterialPageRoute(builder: (context) => sinInBody());
      case signout:
        return MaterialPageRoute(builder: (context) => sign_out_screen(),);
      case homepage_neww:
        return MaterialPageRoute(builder: (context) => homepage_fuck());
      case categaorylistscreenn:
        return MaterialPageRoute(builder: (context) => categaoryListScreen(),);
      case categaoryy:
        Category? category = settings.arguments != null ? settings.arguments as Category : null;
        return MaterialPageRoute(builder: (context) => categaoryes( category));
      case productListScreen:
        return MaterialPageRoute(builder: (context) => ProductListScreen());
      case productScreen:
        return MaterialPageRoute(builder: (context) => ProductScreen(),);
    }
  }
}
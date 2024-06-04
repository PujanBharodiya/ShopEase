import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project1/BreakPratice/NavigatorNamed/Approute.dart';
import 'package:project1/Project_Implementation/Utility/Utility.dart';
import 'package:project1/Project_Implementation/firebase/firebase.dart';
import 'package:project1/Project_Implementation/prefernce/pref_utiles.dart';
import 'package:project1/Project_Implementation/routes/approute.dart';

class sign_in_foam extends StatefulWidget {
  const sign_in_foam({Key? key}) : super(key: key);

  @override
  State<sign_in_foam> createState() => _sign_in_foamState();
}

class _sign_in_foamState extends State<sign_in_foam> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String? emailerror, passworderror;

  Future<void> login(String email, String password, BuildContext context) async {
   Firebase_Services services = Firebase_Services();

   var credential = await services.login(email, password);  //return type dynamic

   if(credential is UserCredential){
     if(credential.user != null){
       print('uid : ${credential!.user!.uid}');
       Navigator.pushNamedAndRemoveUntil(context, approute.homepage_neww, (route) => false);
     }
   } else{
     print(credential);
   }

  }

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildEmailFoamField(),
        SizedBox(height: 24,),
        buildPasswordFoamField(),
        SizedBox(height: 24,),
        buildPasswordWidget(),
        SizedBox(height: 24,),
        buildButtonWidget(context),
      ],
    ));
  }

  buildEmailFoamField() {
    return TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: "Email Address",
        label: Text("Email"),
        errorText: emailerror ,
        floatingLabelBehavior: FloatingLabelBehavior.auto,


      ),
    );
  }

  buildPasswordFoamField() {
    return TextFormField(
      controller: _passwordController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: "Enter Passward",
        label: Text("Password"),
        errorText: passworderror,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
      ),
    );
  }

  buildPasswordWidget() {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () {

        },
        child: Text(
          "Forgot Password",
          style: TextStyle(
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }

  buildButtonWidget(BuildContext context) {
    return MaterialButton(
      color: Colors.blue,
      minWidth: double.infinity,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(28),

      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      onPressed: () {

        String email = _emailController.text.toString().trim();
        String password = _passwordController.text.toString().trim();
        emailerror = null;
        passworderror = null;

        if(email.isEmpty || !Utility.isValidEmail(email)){
          setState(() {
            emailerror = "Enter the valid email";
          });
        }  if (password.isEmpty || !Utility.isVaildPassword(password)){
         setState(() {
           passworderror = "Enter the valid password";
         });
        }
        else{
          // pref_utiles.updateLoginStatus(true).then((value) {
          //   if(value){
          //     Navigator.pushNamedAndRemoveUntil(context, approute.homepage_neww, (route) => false);
          //   }
          // });
          login(email,password,context);

        }




    },
      child: Text("Sign In", style: TextStyle(color: Colors.white),),

    );
  }

}

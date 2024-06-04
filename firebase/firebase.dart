import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:project1/Project_Implementation/model/appUser.dart';
import 'package:project1/Project_Implementation/model/product.dart';

class Firebase_Services{

  static final Firebase_Services instace = Firebase_Services._internal();

  factory Firebase_Services(){
    //factory Constructor
    return instace; //main use that easily access the function of this class to the another class using the factory constructor
    //can access the function of this class to the another class using their instance the maion purpose of this is this part.
    // }
  }


  Firebase_Services._internal();  //named Constructor

  final DatabaseReference _mRef = FirebaseDatabase.instance.ref();


  Future<dynamic> login(String email,String password) async {
    try{
      UserCredential credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return "No user found for that email";
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user.';
      }
    }
  }
  Future<dynamic> signup(String email,String password) async {
    try {
      UserCredential credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      }
    } catch (e) {
      print(e);
    }
  }
  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();

  }
  
  Future<void> createUser(Appuser user) async { //toAdd data of USER in firebase(Server)
    await _mRef.child("user-node").child(user.id!).set(user.toMap());
  }

  Future<bool> createProduct(Product product) async { //toAdd data of PRODUCT in firebase(Server)
    var id = _mRef.push().key; // hierachey mate ID ni under values joise atle forcefully adding the key(id) and add to the productId
    if(id != null) {
      product.id = id;
      await _mRef.child("product-node").child(product.id!).set(product.toMap());
      return true;
    }
    return false;

}
}
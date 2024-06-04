import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project1/Project_Implementation/Utility/Utility.dart';
import 'package:project1/Project_Implementation/firebase/firebase.dart';
import 'package:project1/Project_Implementation/model/appUser.dart';
import 'package:project1/Project_Implementation/prefernce/pref_utiles.dart';
import 'package:project1/Project_Implementation/routes/approute.dart';

class sign_out_field extends StatefulWidget {
  const sign_out_field({Key? key}) : super(key: key);

  @override
  State<sign_out_field>
  createState() => _sign_out_fieldState();
}

class _sign_out_fieldState extends State<sign_out_field> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _dobController = TextEditingController();
  bool passwordview = true;
  bool passwordvieww = true;
  String? gender;
  String dob = "",
      first_name = "",
      last_name = "",
      address = "",
      user_type = "",
      email = "",
      password = "",
      genderr = "",
      contact = "";

  void selectionGender(String value) {
    setState(() {
      gender = value;
    });
  }

  Future _selectDate() async {
    var pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime.now(),
        initialEntryMode: DatePickerEntryMode.calendarOnly
    );
    if (pickedDate != null) {
      setState(() {
        dob = "${pickedDate.day} / ${pickedDate.month} / ${pickedDate.year}";
        _dobController.text = dob;
      });
    }
  }
  Future<void> createAccount(Appuser user,
      BuildContext context) async {
    Firebase_Services services = Firebase_Services();
    var credential = await  services.signup(user.email!, user.password!);
    if(credential is UserCredential){
      if(credential.user != null){
        print('uid : ${credential!.user!.uid}');
        user.id = credential.user!.uid;
        services.createUser(user).then((value) {
          Navigator.pushNamedAndRemoveUntil(context, approute.homepage_neww, (route) => false);

        }).catchError((error){
          print(error.toString());

        });
      }

    } else{
      print(credential);

    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            buildNameFoamField(),
            SizedBox(height: 16,),
            buildEmailFoamField(),
            SizedBox(height: 16,),
            buildContactField(),
            SizedBox(height: 16,),
            buildGenderSelectionField(),
            SizedBox(height: 16,),
            buildUserTypeFoamField(),
            SizedBox(height: 16,),
            buildDateofBirthField(context),
            SizedBox(height: 16,),
            buildAddressFoamField(),
            SizedBox(height: 16,),
            buildPasswordField(),
            SizedBox(height: 16,),
            buildConfirmPassword(),
            SizedBox(height: 16,),
            buildSignUpButtonWidget(context),
          ],
        ),
      ),
    );
  }

  buildNameFoamField() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "First Name";
              } else {
                return null;
              }
            },
            onSaved: (newValue) {
              first_name = newValue.toString();
            },
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              labelText: "First Name",
              hintText: 'First Name',
              floatingLabelBehavior: FloatingLabelBehavior.auto,
            ),
          ),
        ),
        SizedBox(
          width: 16,
        ),
        Expanded(
          child: TextFormField(
            keyboardType: TextInputType.name,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Last name";
              } else {
                return null;
              }
            },
            onSaved: (newValue) {
              last_name = newValue.toString();
            },
            decoration: InputDecoration(
              labelText: "Last Name",
              hintText: 'Last Name',
              floatingLabelBehavior: FloatingLabelBehavior.auto,
            ),
          ),
        )
      ],
    );
  }

  buildEmailFoamField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value == null || value.isEmpty || !Utility.isValidEmail(value)) {
          return "Enter Valid Email";
        } else {
          return null;
        }
      },
      onSaved: (newValue) {
        email = newValue.toString();
      },
      decoration: InputDecoration(
        label: Text("Email"),
        hintText: "Email",
        floatingLabelBehavior: FloatingLabelBehavior.auto,
      ),

    );
  }

  buildContactField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value == null || value.isEmpty || value.length != 10) {
          return "Valid Contact Number";
        } else {
          return null;
        }
      },
      onSaved: (newValue) {
        contact = newValue.toString();
      },
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      decoration: InputDecoration(
        labelText: "Contact",
        hintText: 'Contact',
        floatingLabelBehavior: FloatingLabelBehavior.auto,
      ),
    );
  }

  buildGenderSelectionField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Row(
        children: [
          Text("Gender"),
          Expanded(child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Radio(value: "Male", groupValue: gender, onChanged: (value) {
                selectionGender(value.toString());
              },),
              Text("Male"),
            ],
          )),
          Expanded(child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Radio(value: "Female", groupValue: gender, onChanged: (value) {
                selectionGender(value.toString());
              },),
              Text("Female"),
            ],
          )),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio(value: "Other", groupValue: gender, onChanged: (value) {
                  selectionGender(value.toString());
                },),
                Text("Other"),
              ],
            ),
          )
        ],
      ),
    );
  }

  buildUserTypeFoamField() {
    return DropdownButtonFormField(
      iconEnabledColor: Colors.black45,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please select the Type";
        } else {
          return null;
        }
      },
      onSaved: (newValue) {
        user_type = newValue.toString();
      },
      decoration: InputDecoration(
          labelText: "User Type",
          hintText: 'Select User Type',
          floatingLabelBehavior: FloatingLabelBehavior.auto),

      items:
      [
        DropdownMenuItem(value: "Vender", child: Text("Vender")),
        DropdownMenuItem(value: "User", child: Text("User")),
      ]
      ,
      onChanged: (value) {

      },);
  }

  buildDateofBirthField(BuildContext context) {
    return TextFormField(
      controller: _dobController,
      onTap: () {
        _selectDate();
        FocusScope.of(context).requestFocus(FocusNode());
      },
      onSaved: (newValue) {
        dob = newValue.toString();
      },
      decoration: InputDecoration(
        labelText: "Date of birth",
        hintText: 'Date of birth',
        floatingLabelBehavior: FloatingLabelBehavior.auto,
      ),
    );
  }

  buildAddressFoamField() {
    return TextFormField(
      keyboardType: TextInputType.multiline,
      maxLines: 3,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Enter The Address";
        } else {
          return null;
        }
      },
      onSaved: (newValue) {
        address = newValue.toString();
      },
      decoration: InputDecoration(
        label: Text("Address"),
        hintText: "Address",
        alignLabelWithHint: true,
        floatingLabelBehavior: FloatingLabelBehavior.auto,

      ),
    );
  }

  buildPasswordField() {
    return TextFormField(

      controller: _passwordController,
      keyboardType: TextInputType.text,
      obscureText: passwordview,
      validator: (value) {
        if (value == null || value.isEmpty || !Utility.isVaildPassword(value)) {
          return "Enter The Valid Password";
        } else {
          return null;
        }
      },
      onSaved: (newValue) {
        password = newValue.toString();
      },
      decoration: InputDecoration(
          labelText: "Password",
          hintText: 'Enter password',
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          suffixIcon: IconButton(onPressed: () {
            setState(() {
              passwordview = !passwordview;
            });
          }, icon: Icon(passwordview ? Icons.visibility_off : Icons.visibility))
      ),
    );
  }

  buildConfirmPassword() {
    return TextFormField(
      keyboardType: TextInputType.text,
      obscureText: passwordvieww,
      validator: (value) {
        if (value == null || value.isEmpty ||
            value != _passwordController.text.toString().trim()) {
          return "Can't match with password";
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        labelText: "Confirm Password",
        hintText: 'Enter password',
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        suffixIcon: IconButton(onPressed: () {
          setState(() {
            passwordvieww = !passwordvieww;
          });
        }, icon: Icon(passwordvieww ? Icons.visibility_off : Icons.visibility)),
      ),
    );
  }

  buildSignUpButtonWidget(BuildContext context) {
    return MaterialButton(onPressed: () {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        print('''
        first name : $first_name,
        last name : $last_name,
        email : $email,
        contact : $contact,
        gender " $gender,
        user type : $user_type,
        date of birth : $dob,
        address : $address,
        password : $password
        ''');
        // pref_utiles.updateLoginStatus(true).then((value) {
        //   if(value){
        //     Navigator.pushNamedAndRemoveUntil(context, approute.homepage_neww, (route) => false);
        //   }
        // });
        var user = Appuser(email: email, address: address, contact: contact,dob: dob,firstname: first_name,gender: gender,lastname: last_name,password: password,user_type: user_type);
        createAccount(user, context);

      }
    },
      color: Colors.green,
      minWidth: double.infinity,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28)
      ),
      child: Text("Sign Up"),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
    );
  }
}



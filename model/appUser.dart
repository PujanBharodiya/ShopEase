class Appuser{
  String? id;
  String? firstname;
  String? lastname;
  String? email;
  String? contact;
  String? gender;
  String? user_type;
  String? dob;
  String? address;
  String? password;

  Appuser({this.firstname, this.lastname, this.email, this.contact, this.gender,
      this.user_type, this.dob, this.address, this.password});

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'firstname': this.firstname,
      'lastname': this.lastname,
      'email': this.email,
      'contact': this.contact,
      'gender': this.gender,
      'user_type': this.user_type,
      'dob': this.dob,
      'address': this.address,
      'password': this.password,
    };
  }

}
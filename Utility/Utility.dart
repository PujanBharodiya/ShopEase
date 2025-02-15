class Utility{
  static final _emailRegex = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  static final _passwordRegex =  RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");

  static bool isValidEmail(String email) {
    return _emailRegex.hasMatch(email);
  }
  static bool isVaildPassword(String password){
    return _passwordRegex.hasMatch(password);
  }
}
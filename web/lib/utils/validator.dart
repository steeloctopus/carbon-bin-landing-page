class Validator {
  static bool isEmailValid(String email) {
    RegExp exp = RegExp(r'^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$');
    return exp.hasMatch(email);
  }
}

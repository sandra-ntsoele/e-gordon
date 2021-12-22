import 'package:email_validator/email_validator.dart';

/* 
 * A helper class. 
 * Used to validate form input
 */
class Validator {
  // Fields
  String _email = "";
  String _password = "";

  /* Getters/setters */
  // _email
  String get getEmail => _email;
  set setEmail(String input) => _email = input;

  // _password
  String get getPassword => _password;
  set setPassword(String input) {
    //Hassh..
    _password = input;
  }

  // Validator({this.email, this.password});

  // Methods
  String? validateEmail(String? input) {
    if (input == null || input.isEmpty) {
      return "Email or phone number cannot be empty";
    } else if (!EmailValidator.validate(input)) {
      return "Invalid email";
    } else {
      _email = input;
    }
  }

  String? validatePassword(String? input) {
    /* 
      r'^
      (?=.*[A-Z])       // should contain at least one upper case
      (?=.*[a-z])       // should contain at least one lower case
      (?=.*?[0-9])          // should contain at least one digit
      (?=.*?[!@#\$&*~]).{8,}  // should contain at least one Special character
      $ 
    */
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';

    RegExp regExp = RegExp(pattern);

    if (input!.isEmpty) {
      return "Password cannot be empty";
    } else if (!regExp.hasMatch(input)) {
      return "Enter a valid password";
    } else {
      _password = input;
      return null;
    }
  }
}

import 'package:e_gordon/view/styles.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode? focusNode;

  const PasswordField({
    Key? key,
    required this.controller,
    this.focusNode,
  }) : super(key: key);

  String? _validatePassword(String? userInput) {
    /* 
      r'^
      (?=.*[A-Z])       // should contain at least one upper case
      (?=.*[a-z])       // should contain at least one lower case
      (?=.*?[0-9])          // should contain at least one digit
      (?=.*?[!@#\$&*~]).{8,}  // should contain at least one Special character
      $ 
    */
    String upperCaseChecker = "(?=.*[A-Z])";
    String lowerCaseChecker = "(?=.*[a-z])";
    String digitChecker = "(?=.*?[0-9])";
    String specialCharChecker = "(?=.*?[!@#\$&*~])";
    String lengthChecker = ".{8,32} ";

    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';

    RegExp regExp = RegExp(pattern);

    if (userInput!.isEmpty) {
      return "Password cannot be empty";
    } else if (!regExp.hasMatch(userInput)) {
      // If password does not meet alll rules. Investigate what is missing
      if (!RegExp(upperCaseChecker).hasMatch(userInput)) {
        return "You need one uppercase letter";
      } else if (!RegExp(lowerCaseChecker).hasMatch(userInput)) {
        return "You need one lowercase letter";
      } else if (!RegExp(digitChecker).hasMatch(userInput)) {
        return "You need one number";
      } else if (!RegExp(specialCharChecker).hasMatch(userInput)) {
        return "You need one special character";
      } else if (!RegExp(lengthChecker).hasMatch(userInput)) {
        return "Must be 8 characters or more";
      } else {
        return "Enter a valid password";
      }
    } else {
      // _password = userInput;
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      obscureText: true,
      // [START Behaviour]
      validator: (userInput) => _validatePassword(userInput),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      // [END Behaviour]
      // [START Decoration]
      decoration: FormStyles.textFormDecoration(
        labelText: "Password",
        prefixIcon: Icons.lock_outline,
      ),
      // [END Decoration]
    );
  }
}

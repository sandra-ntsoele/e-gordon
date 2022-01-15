import 'dart:async';
import 'dart:developer';

import 'package:e_gordon/model/auth_model.dart';
import 'package:e_gordon/view/components/text_components/paragraph.dart';
import 'package:e_gordon/view/constants.dart';
import 'package:e_gordon/view/profile/profile.dart';
import 'package:e_gordon/view/sign_in/sign_in.dart';
import 'package:e_gordon/view/verify/verify.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AuthController {
  /* 
   * Class methods 
   */

  void signIn(context, email, password) async {
    AuthModel authModel = AuthModel();

    authModel.signIn(email, password).then((error) {
      if (error == null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const MyProfile(),
          ),
        );
      } else {
        showDialog(
          context: context,
          builder: (context) {
            const duration = Duration(seconds: 2);
            Future.delayed(duration, () => Navigator.of(context).pop());
            return CustomAlert(message: error);
          },
        );
      }
    });
  }

  void signOutUser(context) {
    FirebaseAuth.instance.signOut().then((value) => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SignIn(),
          ),
        ));
  }

  void registerUser(context, {displayName, email, password}) {
    AuthModel userModel = AuthModel();

    try {
      userModel.addUser(displayName, email, password).then(
        (value) {
          User? user = FirebaseAuth.instance.currentUser;

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VerifyEmail(user: user),
            ),
          );
        },
      );
    } catch (e) {
      log("Something went wrong:\n${e.toString()}");
    }
  }

  String? validateEmail(String? userInput) {
    if (userInput == null || userInput.isEmpty) {
      return "Email cannot be empty";
    } else if (!EmailValidator.validate(userInput)) {
      return "Invalid email";
    } else {
      // _email = userInput;
      return null;
    }
  }

  String? validatePassword(String? userInput) {
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
}

class CustomAlert extends StatelessWidget {
  const CustomAlert({
    Key? key,
    required this.message,
  }) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Timer startTimer() {
      const duration = Duration(seconds: 2);

      return Timer(duration, () {
        Navigator.pop(context);
      });
    }

    return AlertDialog(
      content: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/images/verify-email-trans.png",
            width: size.width * 0.13,
            fit: BoxFit.contain,
          ),
          SizedBox(width: size.width * 0.03),
          Text(
            message,
            style: TextStyle(fontSize: smallText),
          )
        ],
      ),
    );
  }
}

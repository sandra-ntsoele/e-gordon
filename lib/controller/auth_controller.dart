import 'dart:async';

import 'package:e_gordon/model/auth_model.dart';
import 'package:e_gordon/services/auth_service.dart';
import 'package:e_gordon/view/profile/profile.dart';
import 'package:e_gordon/view/sign_in/components/custom_alert.dart';
import 'package:e_gordon/view/sign_in/sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthController {
  final _authService = AuthService();

  void registerUserWithEmail(
    context, {
    String? firstName,
    required String email,
    required String password,
  }) async {
    String? response = await _authService.createAccount(
      email.trim(),
      password.trim(),
    );

    if (response == "Success") {
      Navigator.of(context).pushNamed("/explore");
    } else {
      showDialog(
        context: context,
        builder: (context) {
          Duration duration = const Duration(milliseconds: 1800);
          Future.delayed(
            duration,
            () => Navigator.of(context).pop(),
          );
          return CustomAlert(message: response);
        },
      );
    }
  }

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
}

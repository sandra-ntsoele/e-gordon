import 'dart:async';

import 'package:e_gordon/model/auth_model.dart';
import 'package:e_gordon/model/user_model.dart';
import 'package:e_gordon/services/auth_service.dart';
import 'package:e_gordon/view/profile/profile.dart';
import 'package:e_gordon/view/sign_in/components/custom_alert.dart';
import 'package:e_gordon/view/sign_in/sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthController {
  BuildContext context;
  final _authService = AuthService();

  AuthController(this.context);

  Future<bool?> registerUserWithEmail(
    context, {
    required String firstName,
    required String email,
    required String password,
  }) async {
    String? response = await _authService.createAccount(
      firstName.trim(),
      email.trim(),
      password.trim(),
    );

    if (response == "Success") {
      Navigator.of(context).pushNamed(
        "/registration-verification",
        arguments: UserModel(email, firstName),
      );
      return null;
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
      return false;
    }
  }

  void signInWithGoogle() {
    _authService.signInWithGoogle().then(
      (userCredential) {
        Navigator.of(context).pushNamed("/explore");
      },
      onError: (error) {
        print("On error: ${error.message}");
        showDialog(
          context: context,
          builder: (context) {
            Duration duration = const Duration(milliseconds: 1800);
            Future.delayed(
              duration,
              () => Navigator.of(context).pop(),
            );
            return const CustomAlert(message: "Authentication failed");
          },
        );
      },
    );
  }

  Future<bool?> signIn(context, email, password) async {
    String? response = await _authService.signInWithEmail(
      email.trim(),
      password.trim(),
    );

    if (response == "Success") {
      Navigator.of(context).pushNamed("/explore");
      return null;
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
      return false;
    }
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

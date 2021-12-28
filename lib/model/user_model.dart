import 'dart:async';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypt/crypt.dart';
import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  String email, password;
  final CollectionReference users =
      FirebaseFirestore.instance.collection("users");

  UserModel(this.email, this.password);

  Future addUser() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    UserCredential userCredential;

    userCredential = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    verifyUserEmail();
  }

  void verifyUserEmail() {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null && !user.emailVerified) {
      var actionCodeSettings = ActionCodeSettings(
        url: 'https://e-gordon.web.app/?email=${user.email}',
        androidPackageName: 'com.egordon.android',
        androidInstallApp: true,
        androidMinimumVersion: '12',
        handleCodeInApp: true,
        dynamicLinkDomain: "egordon.page.link",
      );

      user.sendEmailVerification();
    } else {
      print("userIsNULL: ${user == null}");
    }
  }
}

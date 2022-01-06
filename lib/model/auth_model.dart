import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthModel {
  String email, password;
  final CollectionReference users =
      FirebaseFirestore.instance.collection("users");

  AuthModel(this.email, this.password);

  Future addUser() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = FirebaseAuth.instance.currentUser;

    UserCredential userCredential;

    // Create user
    userCredential = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    // Send verification email

    if (user != null && !user.emailVerified) {
      user.sendEmailVerification();
    }
  }

  void verifyUserEmail() {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null && !user.emailVerified) {
      user.sendEmailVerification();
    }
  }
}

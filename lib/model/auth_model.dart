import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthModel {
  CollectionReference users = FirebaseFirestore.instance.collection("users");

  Future addUser(displayName, email, password) async {
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
      user.sendEmailVerification().then((value) {
        user.updateDisplayName(displayName);
      });
    }
    return user;
  }

  void verifyUserEmail() {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null && !user.emailVerified) {
      user.sendEmailVerification();
    }
  }
}

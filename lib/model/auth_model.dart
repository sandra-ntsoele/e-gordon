// ignore_for_file: unused_local_variable

import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthModel {
  CollectionReference users = FirebaseFirestore.instance.collection("users");

  Future signIn(email, password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      log("Code: ${e.code}");
      if (e.code == 'user-not-found') {
        return "No user found for that email.";
      } else if (e.code == 'wrong-password') {
        return "Incorrect password.";
      } else if (e.code == "too-many-requests") {
        return "Please try again later.";
      }
    }
  }

  Future addUser(displayName, email, password) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    UserCredential userCredential;

    // Create user
    userCredential = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    User? user = FirebaseAuth.instance.currentUser;

    // Send verification email
    if (user != null && !user.emailVerified) {
      user.sendEmailVerification();
      user.updateDisplayName(displayName);
    }
    return user;
  }
}

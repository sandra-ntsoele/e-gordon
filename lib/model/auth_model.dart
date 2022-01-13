import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthModel {
  CollectionReference users = FirebaseFirestore.instance.collection("users");

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

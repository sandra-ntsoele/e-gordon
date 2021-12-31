import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
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
      user.sendEmailVerification();
    }
  }
}

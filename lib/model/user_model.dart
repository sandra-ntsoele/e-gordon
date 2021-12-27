import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypt/crypt.dart';
import 'package:crypto/crypto.dart';

class UserModel {
  String email, password;
  final CollectionReference users =
      FirebaseFirestore.instance.collection("users");

  UserModel(this.email, this.password);

  Future addUser() async {
    // Generate random salt
    String salt = Crypt.sha256(password).toString();

    // Append salt to password
    String saltedPassword = password + salt;

    // Hash password
    String hashedPassword =
        sha1.convert(utf8.encode(saltedPassword)).toString();

    // Call user's CollectionReference to add a new user
    return users
        .add({
          "emailAddress": email,
          "passwordSalt": salt,
          "passwordHash": hashedPassword,
        })
        .then((value) => print("User added"))
        .catchError((error) => print("Failed: \n$error"));
  }
}

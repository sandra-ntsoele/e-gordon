import 'package:e_gordon/services/auth_service.dart';
import 'package:e_gordon/view/components/index_app_bar.dart';
import 'package:e_gordon/view/sign_in/sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Index extends StatefulWidget {
  const Index({Key? key}) : super(key: key);

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  final userStream = AuthService().userStateStream;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: userStream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const SignIn();
        } else {
          final User? currentUser = AuthService().user;
          return Scaffold(
            appBar: IndexAppBar(currentUser: currentUser),
          );
        }
      },
    );
  }
}

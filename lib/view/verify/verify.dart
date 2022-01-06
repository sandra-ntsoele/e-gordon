import 'dart:async';

import 'package:e_gordon/view/components/text_components/heading.dart';
import 'package:e_gordon/view/components/text_components/paragraph.dart';
import 'package:e_gordon/view/profile/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class VerifyEmail extends StatefulWidget {
  User? user;

  VerifyEmail({
    Key? key,
    this.user,
  }) : super(key: key);

  @override
  _VerifyEmailState createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  final auth = FirebaseAuth.instance;
  Timer? timer;

  @override
  void initState() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      checkEmailVerified();
    });

    super.initState();
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: size.height,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/verify-email-trans.png",
                height: size.height * 0.25,
              ),
              SizedBox(height: size.height * 0.03),
              Heading(
                text: "Check your email",
                headingType: 1,
                overflow: false,
              ),
              SizedBox(height: size.height * 0.05),
              Paragraph(
                text:
                    "We sent a verification link to \n${widget.user!.email ?? 'your email'}",
                paragraphType: 2,
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> checkEmailVerified() async {
    widget.user = auth.currentUser;
    await widget.user!.reload();

    if (widget.user!.emailVerified) {
      timer!.cancel();

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const MyProfile(),
        ),
      );
    }
  }
}

import 'dart:async';

import 'package:e_gordon/model/user_model.dart';
import 'package:e_gordon/services/auth_service.dart';
import 'package:e_gordon/view/components/text_components/heading.dart';
import 'package:e_gordon/view/components/text_components/paragraph.dart';
import 'package:flutter/material.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({
    Key? key,
  }) : super(key: key);

  @override
  _VerifyEmailState createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  Timer? timer;
  final AuthService _authService = AuthService();

  @override
  void initState() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      // Check if email is verified
      if (_authService.emailIsVerified) {
        Navigator.of(context).pushNamed("/explore");
        timer.cancel();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final user = ModalRoute.of(context)!.settings.arguments as UserModel;

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
                text: "We sent a verification link to \n${user.email}",
                paragraphType: 2,
              )
            ],
          ),
        ),
      ),
    );
  }
}

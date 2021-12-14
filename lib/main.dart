import 'package:e_gordon/screens/password_recovery/new_password.dart';
import 'package:e_gordon/screens/password_recovery/password_recovery.dart';
import 'package:e_gordon/screens/password_recovery/password_reset_verification.dart';
import 'package:flutter/material.dart';
import 'screens/onboarding/onboarding.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.inter().fontFamily,
      ),
      home: const Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: NewPassword(),
        ),
      ),
    );
  }
}

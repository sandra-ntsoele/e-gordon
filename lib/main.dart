import 'package:e_gordon/view/constants.dart';
import 'package:e_gordon/view/home_page/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'view/onboarding/onboarding.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart'; // Firebase core plugin
import 'firebase_options.dart'; // Firebase config

void main() async {
  // Initialize Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.inter().fontFamily,
        scrollbarTheme: ScrollbarThemeData(
          thumbColor: MaterialStateProperty.all(outlineColour),
          radius: const Radius.circular(100),
        ),
      ),
      home: Scaffold(
        body: user == null ? const OnboardingScreen() : const HomePage(),
      ),
    );
  }
}

import 'package:e_gordon/custom_theme.dart';
import 'package:e_gordon/view/explore_page/explore_page.dart';
import 'package:e_gordon/view/index.dart';
import 'package:e_gordon/view/profile/profile.dart';
import 'package:e_gordon/view/registration/registration_screen.dart';
import 'package:e_gordon/view/sign_in/sign_in.dart';
import 'package:e_gordon/view/verify/verify.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'view/splash_screen/splash_screen.dart';

void main() async {
  // Initialize Firebase
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await Supabase.initialize(
      url: "https://igzvyjvoqclpdwvokngt.supabase.co",
      anonKey:
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImlnenZ5anZvcWNscGR3dm9rbmd0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NTAyOTE5NjQsImV4cCI6MTk2NTg2Nzk2NH0.ogT2qbFL-4RxbzVWA_Ab2kTLOcGOcXRGOITjGCebHPA");
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.light(),
      routes: {
        "/": (context) => SplashScreen(),
        "/register": (context) => const RegistrationScreen(),
        "/registration-verification": (context) => const VerifyEmail(),
        "/login": (context) => const SignIn(),
        "/index": (context) => const Index(),
        "/explore": (context) => const ExplorePage(),
        "/profile": (context) => const MyProfile(),
      },
      initialRoute: "/",
    );
  }
}

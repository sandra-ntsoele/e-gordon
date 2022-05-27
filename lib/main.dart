import 'package:e_gordon/view/constants.dart';
import 'package:e_gordon/view/profile/profile.dart';
import 'package:e_gordon/view/registration/registration_screen.dart';
import 'package:e_gordon/view/settings/settings.dart';
import 'package:e_gordon/view/sign_in/sign_in.dart';
import 'package:e_gordon/view/to_buy/to_buy.dart';
import 'package:e_gordon/view/verify/verify.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'view/onboarding/onboarding.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  // Initialize Firebase
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
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
      theme: themeData(),
      routes: {
        "/": (context) => OnboardingScreen(),
        "/register": (context) => const RegistrationScreen(),
        "/login": (context) => const SignIn(),
        "/registration-verification": (context) => VerifyEmail(),
        "/profile": (context) => const MyProfile(),
        "/settings": (context) => const Settings(),
        "/to-buy": (context) => const ToBuy(),
      },
      initialRoute: "/",
      // home: Scaffold(
      //   backgroundColor: Colors.white,
      //   floatingActionButton: FloatingActionButton(
      //     onPressed: () {},
      //     child: const Icon(Icons.create_outlined),
      //     backgroundColor: ColourStyles.primary,
      //   ),
      //   floatingActionButtonLocation:
      //       FloatingActionButtonLocation.centerDocked,
      //   bottomNavigationBar: CustomBottomNavbar(
      //     onTap: (itemIndex) => setState(() => pageIndex = itemIndex),
      //   ),
      //   body: _pages[pageIndex],
      // ),
    );
  }

  ThemeData themeData() {
    return ThemeData(
      fontFamily: GoogleFonts.inter().fontFamily,
      scrollbarTheme: ScrollbarThemeData(
        thumbColor: MaterialStateProperty.all(outlineColour),
        radius: const Radius.circular(100),
      ),
    );
  }
}

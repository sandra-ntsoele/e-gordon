import 'package:e_gordon/view/constants.dart';
import 'package:e_gordon/view/explore_page/components/explore_bottom_navbar.dart';
import 'package:e_gordon/view/explore_page/explore_page.dart';
import 'package:e_gordon/view/profile/profile.dart';
import 'package:e_gordon/view/settings/settings.dart';
import 'package:e_gordon/view/sign_in/sign_in.dart';
import 'package:e_gordon/view/styles.dart';
import 'package:e_gordon/view/to_buy/to_buy.dart';
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

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int pageIndex = 0;
  final List<Widget> _pages = [];

  @override
  void initState() {
    _pages.add(const ExplorePage());
    _pages.add(const ToBuy());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    return user == null
        ? MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: themeData(),
            home: const Scaffold(
              body: OnboardingScreen(),
            ),
          )
        : MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: themeData(),
            routes: {
              "/profile": (context) => const MyProfile(),
              "/settings": (context) => const Settings(),
              "/to-buy": (context) => const ToBuy(),
            },
            home: Scaffold(
              backgroundColor: Colors.white,
              floatingActionButton: FloatingActionButton(
                onPressed: () {},
                child: const Icon(Icons.create_outlined),
                backgroundColor: ColourStyles.primary,
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              bottomNavigationBar: CustomBottomNavbar(
                onTap: (itemIndex) => setState(() => pageIndex = itemIndex),
              ),
              body: _pages[pageIndex],
            ),
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

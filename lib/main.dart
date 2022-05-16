import 'package:e_gordon/view/constants.dart';
import 'package:e_gordon/view/explore_page/explore_page.dart';
import 'package:e_gordon/view/profile/profile.dart';
import 'package:e_gordon/view/registration/registration_screen.dart';
import 'package:e_gordon/view/settings/settings.dart';
import 'package:e_gordon/view/sign_in/sign_in.dart';
import 'package:e_gordon/view/to_buy/to_buy.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'view/onboarding/onboarding.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  // Initialize Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
      url: 'https://igzvyjvoqclpdwvokngt.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImlnenZ5anZvcWNscGR3dm9rbmd0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NTAyOTE5NjQsImV4cCI6MTk2NTg2Nzk2NH0.ogT2qbFL-4RxbzVWA_Ab2kTLOcGOcXRGOITjGCebHPA');
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData(),
      routes: {
        "/": (context) => const OnboardingScreen(),
        "/register": (context) => const RegistrationScreen(),
        "/login": (context) => const SignIn(),
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

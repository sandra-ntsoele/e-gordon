import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTheme {
  // Supporting colours
  static Color lightGray = const Color.fromRGBO(244, 245, 247, 1);
  static Color white = const Color.fromRGBO(255, 255, 255, 1);
  static Color outline = const Color.fromRGBO(208, 219, 234, 1);
  // Main colours
  static Color primaryEmerald = const Color.fromRGBO(31, 204, 121, 1);
  static Color secondaryBittersweet = const Color.fromRGBO(255, 100, 100, 1);
  // Text colours
  static Color mainTextPrussianBlue = const Color.fromRGBO(46, 62, 92, 1);
  static Color secondaryTextWildBlue = const Color.fromRGBO(159, 165, 192, 1);

  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: mainTextPrussianBlue,
    ),
    headlineMedium: TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.bold,
      color: mainTextPrussianBlue,
    ),
    headlineSmall: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.bold,
      color: mainTextPrussianBlue,
    ),
    bodyLarge: TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w500,
      color: mainTextPrussianBlue,
    ),
    bodyMedium: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      color: mainTextPrussianBlue,
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: mainTextPrussianBlue,
    ),
  );

  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      fontFamily: GoogleFonts.inter().fontFamily,
      appBarTheme: AppBarTheme(
        foregroundColor: mainTextPrussianBlue,
        backgroundColor: white,
        elevation: 0,
      ),
      popupMenuTheme: PopupMenuThemeData(
        textStyle: TextStyle(
          color: mainTextPrussianBlue,
          fontSize: lightTextTheme.bodyMedium?.fontSize,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: white,
        selectedItemColor: primaryEmerald,
        unselectedItemColor: outline,
        selectedLabelStyle: const TextStyle(fontSize: 10),
        unselectedLabelStyle: const TextStyle(fontSize: 10),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: primaryEmerald,
      ),
      scrollbarTheme: ScrollbarThemeData(
        thumbColor: MaterialStateProperty.all(outline),
        radius: const Radius.circular(100),
      ),
      // textTheme: lightTextTheme,
    );
  }
}

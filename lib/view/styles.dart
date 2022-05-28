import 'package:flutter/material.dart';

class LayoutStyles {
  static double defaultPadding = 25;
  static BorderRadius rounded = BorderRadius.circular(50);
  static BorderRadius curved = BorderRadius.circular(25);
  static EdgeInsets completePadding = const EdgeInsets.all(25);
  static EdgeInsets horizontalPadding =
      const EdgeInsets.symmetric(horizontal: 25);
  static EdgeInsets verticalPadding = const EdgeInsets.symmetric(vertical: 25);
}

class ColourStyles {
  static Color lightGray = const Color.fromRGBO(244, 245, 247, 1);
  static Color white = const Color.fromRGBO(255, 255, 255, 1);
  static Color outline = const Color.fromRGBO(208, 219, 234, 1);
  static Color primary = const Color.fromRGBO(31, 204, 121, 1);
  static Color secondary = const Color.fromRGBO(255, 100, 100, 1);
  static Color mainText = const Color.fromRGBO(46, 62, 92, 1);
  static Color secondaryText = const Color.fromRGBO(159, 165, 192, 1);
}

class FormStyles {
  static InputDecoration textFormDecoration({labelText, prefixIcon}) {
    return InputDecoration(
      labelText: labelText,
      prefixIcon: Icon(prefixIcon),
      labelStyle: TextStyle(
        color: ColourStyles.secondaryText,
        fontSize: 14,
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      border: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(100)),
        borderSide: BorderSide(
          color: ColourStyles.outline,
          width: 2,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(100)),
        borderSide: BorderSide(
          color: ColourStyles.outline,
          width: 2,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColourStyles.primary,
          width: 2,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(100)),
      ),
    );
  }
}

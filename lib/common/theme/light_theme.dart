import 'package:fit_app/common/theme/colors.dart';

import 'package:flutter/material.dart';

ThemeData lightTheme() {
  return ThemeData(
    brightness: Brightness.light,
    primaryColor: kPrimaryColor,
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontSize: 38,
        fontWeight: FontWeight.w700,
        color: defaultTextColor100,
        letterSpacing: 0,
      ),
      displayMedium: TextStyle(
        fontSize: 34,
        fontWeight: FontWeight.w700,
        color: defaultTextColor100,
        letterSpacing: 0,
      ),
      displaySmall: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w600,
        color: defaultTextColor100,
        letterSpacing: 0,
      ),
      headlineMedium: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w700,
        color: defaultTextColor100,
        letterSpacing: 0,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: defaultTextColor100,
        letterSpacing: 0,
      ),
      titleMedium: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w600,
        color: defaultTextColor60,
        letterSpacing: 0,
      ),
      titleSmall: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: defaultTextColor100,
        letterSpacing: 0,
      ),
      bodyLarge: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w400,
        color: defaultTextColor100,
        letterSpacing: 0,
      ),
      bodyMedium: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: defaultTextColor80,
        letterSpacing: 0,
      ),
      labelLarge: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: Colors.white,
        letterSpacing: 0,
      ),
    ),
  );
}

import 'package:fit_app/common/theme/colors.dart';

import 'package:flutter/material.dart';

ThemeData lightTheme() {
  return ThemeData(
    brightness: Brightness.light,
    primaryColor: kPrimaryColor,
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 38,
        fontWeight: FontWeight.w700,
        color: defaultTextColor100,
        letterSpacing: 0,
      ),
      headline2: TextStyle(
        fontSize: 34,
        fontWeight: FontWeight.w700,
        color: defaultTextColor100,
        letterSpacing: 0,
      ),
      headline3: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w600,
        color: defaultTextColor100,
        letterSpacing: 0,
      ),
      headline4: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w700,
        color: defaultTextColor100,
        letterSpacing: 0,
      ),
      headline6: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: defaultTextColor100,
        letterSpacing: 0,
      ),
      subtitle1: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w600,
        color: defaultTextColor60,
        letterSpacing: 0,
      ),
      subtitle2: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: defaultTextColor100,
        letterSpacing: 0,
      ),
      bodyText1: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w400,
        color: defaultTextColor100,
        letterSpacing: 0,
      ),
      bodyText2: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: defaultTextColor80,
        letterSpacing: 0,
      ),
      button: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: Colors.white,
        letterSpacing: 0,
      ),
    ),
  );
}

import 'dart:ui';

import 'package:flutter/material.dart';

class AppStyle{
  static Color lightPrimaryColor  = Color(0xffb7935f);
  static Color lightAccentColor  = Color(0xffd9d9d9);
  static Color darkPrimaryColor  = Color(0xffFACC1D);
  static Color darkAccentColor  = Color(0xff141A2E);


  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
     primaryColor: lightPrimaryColor,
    textTheme: TextTheme(
      titleLarge: TextStyle(color: Colors.black, fontSize: 22),
      titleMedium: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: lightPrimaryColor),
      displayMedium: TextStyle(
          fontSize: 30,
          color: Colors.black
      ),
      bodySmall: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 30
      ),
      headlineMedium: TextStyle(
          fontSize: 25,
          fontFamily: 'Cairo',
          fontWeight: FontWeight.w900,
          color: Colors.white
      ),
    )
    );
  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      primaryColor: darkPrimaryColor,
      textTheme: TextTheme(
        titleLarge: TextStyle(color: Colors.white, fontSize: 22),
        titleMedium: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,  color: darkPrimaryColor),
        displayMedium: TextStyle(
            fontSize: 30,
            color: Colors.white
        ),
        bodySmall: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30
        ),
        headlineMedium:TextStyle(
            fontSize: 25,
            fontFamily: 'Cairo',
            fontWeight: FontWeight.w900,
            color: Colors.black
        ),
      )
  );
}
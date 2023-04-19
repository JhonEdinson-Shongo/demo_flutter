import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Colors.indigo;

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: primaryColor,
    // AppBar Theme Light
    appBarTheme: AppBarTheme(
      color: primaryColor,
      elevation: 1,
    ),
    // Button Theme Light
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(primary: primaryColor),
    ),
    // FloatingActionButton Theme Light
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
      elevation: 5,
    ),
    // ElevatedButton Theme Light
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: primaryColor,
        shape: StadiumBorder(),
        elevation: 5,
      ),
    ),
    // InputDecoration Theme Light
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(color: primaryColor),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: primaryColor),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: primaryColor),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: primaryColor,
    appBarTheme: AppBarTheme(
      color: primaryColor,
      elevation: 1,
    ),
  );
}

import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xFFE2BE7F);
  static const Color black = Color(0xFF202020);
  static const Color white = Color(0xFFFFFFFF);

  static ThemeData lightTheme = ThemeData(
    primaryColor: primary,
    appBarTheme: AppBarTheme(
      backgroundColor: black,
      foregroundColor: primary,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: primary,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    scaffoldBackgroundColor: black,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: primary,
      selectedItemColor: white,
      unselectedItemColor: black,
      showSelectedLabels: true,
      showUnselectedLabels: false,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: primary,
    appBarTheme: AppBarTheme(
      backgroundColor: primary,
      foregroundColor: white,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: primary,
      selectedItemColor: white,
      unselectedItemColor: black,
      showSelectedLabels: true,
      showUnselectedLabels: false,
    ),
    textTheme: TextTheme(
      headlineSmall:
          TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: white),
      titleLarge:
          TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: white),
      titleMedium:
          TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: white),
      titleSmall:
          TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: white),
    ),
  );
}

import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary =
      Color(0xFFE2BE7F); // Background color for the navigation bar
  static const Color black = Color(0xFF202020); // Unselected item color
  static const Color white = Color(0xFFFFFFFF); // Selected item color

  static ThemeData lightTheme = ThemeData();

  static ThemeData darktheme = ThemeData(
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: primary, // Navigation bar background color
      selectedItemColor: white, // Selected item color
      unselectedItemColor: black, // Unselected item color
      showSelectedLabels: true,
      showUnselectedLabels: false,
    ),
  );
}

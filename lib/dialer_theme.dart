import 'package:flutter/material.dart';

class DialerTheme {
  static ThemeData light() {
    const diwodoGreen = Color(0xff00ff00);

    return ThemeData(
      brightness: Brightness.light,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: diwodoGreen,
        foregroundColor: Colors.white,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: diwodoGreen,
      ),
    );
  }

  static ThemeData dark() {
    const diwodoGreen = Color(0xff00ff00);

    return ThemeData(
      brightness: Brightness.dark,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: diwodoGreen,
        foregroundColor: Colors.white,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: diwodoGreen,
      ),
    );
  }
}

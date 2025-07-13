import 'package:flutter/material.dart';

class ThemeManager {
  static final lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    fontFamily: 'Roboto',
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: Colors.black),
      headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      headlineMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
    ),
    cardColor: Colors.white,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
    ),
  );

  static final darkTheme = ThemeData(
    primarySwatch: Colors.grey,
    fontFamily: 'Roboto',
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.grey[900],
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: Colors.white),
      headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      headlineMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
    ),
    cardColor: Colors.grey[800],
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
    ),
  );
}

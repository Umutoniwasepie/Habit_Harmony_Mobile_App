import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: Colors.blue,
    hintColor: Colors.green,
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.blue, // Primary button color
      textTheme: ButtonTextTheme.primary, // Button text color
    ),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: Colors.indigo,
    hintColor: Colors.teal,
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.indigo, // Primary button color
      textTheme: ButtonTextTheme.primary, // Button text color
    ),
  );
}

import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: Colors.blue,
    accentColor: Colors.green,
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.blue, // Primary button color
      textTheme: ButtonTextTheme.primary, // Button text color
    ),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: Colors.indigo,
    accentColor: Colors.teal,
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.indigo, // Primary button color
      textTheme: ButtonTextTheme.primary, // Button text color
    ),
  );
}

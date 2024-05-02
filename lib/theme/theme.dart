import 'package:flutter/material.dart';

final ThemeData myTheme = ThemeData(
  // Define the text theme for your app
  textTheme: TextTheme(
    // Define the default text style for regular body text
    bodyLarge: TextStyle(
      fontSize: 16.0,
      color: Colors.green,
    ),
    // Define the default text style for bold body text
    bodyMedium: TextStyle(
      fontSize: 16.0,
      color: Colors.greenAccent,
      fontWeight: FontWeight.bold,
    ),
    // Define the text style for headings
    displayLarge: TextStyle(
      fontSize: 24.0,
      color: Colors.lightGreen,
      fontWeight: FontWeight.bold,
    ),
    // Define the text style for subheadings
    displayMedium: TextStyle(
      fontSize: 20.0,
      color: Colors.lightGreenAccent,
      fontWeight: FontWeight.bold,
    ),
    // Define the text style for captions
    bodySmall: TextStyle(
      fontSize: 14.0,
      color: Colors.white,
    ),
    // Define the text style for buttons
    labelLarge: TextStyle(
      fontSize: 16.0,
      color: Colors.white70,
      fontWeight: FontWeight.bold,
    ),
  ),
);

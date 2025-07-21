import 'package:flutter/material.dart';

// Recommended color palette
const Color kPrimaryColor = Colors.white;
const Color kSecondaryColor = Color(0xFF10b981); // Material green
const Color kAccentColor = Color(0xFF8E24AA); // Material purple

final ThemeData appTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: kPrimaryColor,
  scaffoldBackgroundColor: kPrimaryColor,
  colorScheme: ColorScheme.light(
    primary: kPrimaryColor,
    secondary: kSecondaryColor,
    surface: kPrimaryColor,
    onPrimary: Colors.black,
    onSecondary: Colors.white,
    onSurface: Colors.black,
    tertiary: kAccentColor,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: kSecondaryColor, // Use transparent for gradient
    foregroundColor: Colors.transparent,
    elevation: 2,
    iconTheme: IconThemeData(color: kPrimaryColor),
    titleTextStyle: TextStyle(
      color: kPrimaryColor,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: kAccentColor,
    foregroundColor: Colors.white,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: kSecondaryColor,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(foregroundColor: kAccentColor),
  ),
  iconTheme: const IconThemeData(color: kAccentColor),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.grey[200],
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(24.0),
      borderSide: BorderSide.none,
    ),
    hintStyle: const TextStyle(color: Colors.grey),
  ),
  cardTheme: CardThemeData(
    color: kPrimaryColor,
    elevation: 5,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  ),
  progressIndicatorTheme: const ProgressIndicatorThemeData(color: kAccentColor),
  searchBarTheme: SearchBarThemeData(
    backgroundColor: WidgetStatePropertyAll(kPrimaryColor.withValues(alpha: 0.3)),
    textStyle: WidgetStatePropertyAll(TextStyle(color: Colors.black)),
    hintStyle: WidgetStatePropertyAll(TextStyle(color: kPrimaryColor)),
  ),
);

import 'package:flutter/material.dart';

// Recommended color palette
const Color kLightPrimaryColor = Colors.white;
const Color kLightSecondaryColor = Color(0xFF10b981); // Material green
const Color kLightAccentColor = Color(0xFF8E24AA); // Material purple

const Color kDarkPrimaryColor = Color(0xFF121212); // Dark background
const Color kDarkSecondaryColor = Color(0xFF64ffda); // Teal accent
const Color kDarkAccentColor = Color(0xFFbb86fc); // Purple accent

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: kLightPrimaryColor,
  scaffoldBackgroundColor: kLightPrimaryColor,
  colorScheme: ColorScheme.light(
    primary: kLightPrimaryColor,
    secondary: kLightSecondaryColor,
    surface: kLightPrimaryColor,
    onPrimary: Colors.black,
    onSecondary: Colors.white,
    onSurface: Colors.black,
    tertiary: kLightAccentColor,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: kLightSecondaryColor, // Use transparent for gradient
    foregroundColor: Colors.transparent,
    elevation: 2,
    iconTheme: IconThemeData(color: kLightPrimaryColor),
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: kLightPrimaryColor,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: kLightAccentColor,
    foregroundColor: Colors.white,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: kLightSecondaryColor,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(foregroundColor: kLightAccentColor),
  ),
  iconTheme: const IconThemeData(color: kLightAccentColor),
  inputDecorationTheme: InputDecorationTheme(
    // filled: true,
    // fillColor: Colors.grey[200],
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(50.0),
      borderSide: BorderSide(color: Colors.grey[100]!, width: 1),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: kLightSecondaryColor),
      borderRadius: BorderRadius.circular(50),
    ),
    iconColor: Colors.grey,
    prefixIconColor: Colors.grey,
    hintStyle: const TextStyle(color: Colors.grey),
  ),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: kLightSecondaryColor,
    selectionColor: kLightSecondaryColor,
  ),
  cardTheme: CardThemeData(
    color: kLightPrimaryColor,
    elevation: 5,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  ),
  progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: kLightSecondaryColor), // Set the color here
  searchBarTheme: SearchBarThemeData(
    backgroundColor: WidgetStatePropertyAll(
      kLightPrimaryColor.withOpacity(0.3),
    ),
    textStyle: WidgetStatePropertyAll(const TextStyle(color: Colors.black)),
    hintStyle: WidgetStatePropertyAll(const TextStyle(color: Colors.grey)),
  ),
  chipTheme: ChipThemeData(
    backgroundColor: Colors.grey[200],
    labelStyle: const TextStyle(color: Colors.black),
    secondaryLabelStyle: const TextStyle(color: Colors.white),
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    side: BorderSide.none,
  ),
  dialogTheme: DialogThemeData(
    backgroundColor: kLightPrimaryColor,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    titleTextStyle: const TextStyle(
        color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
    contentTextStyle: const TextStyle(color: Colors.black87, fontSize: 16),
  ),
  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: kLightPrimaryColor,
    shape: RoundedRectangleTopBorder(borderRadius: BorderRadius.circular(16)),
  ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: kDarkPrimaryColor,
  scaffoldBackgroundColor: kDarkPrimaryColor,
  colorScheme: ColorScheme.dark(
    primary: kDarkPrimaryColor,
    secondary: kDarkSecondaryColor,
    surface: kDarkPrimaryColor,
    onPrimary: Colors.white,
    onSecondary: Colors.black,
    onSurface: Colors.white,
    tertiary: kDarkAccentColor,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: kDarkSecondaryColor, // Use transparent for gradient
    foregroundColor: Colors.transparent,
    elevation: 2,
    iconTheme: IconThemeData(color: kDarkPrimaryColor),
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: kDarkPrimaryColor,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: kDarkAccentColor,
    foregroundColor: Colors.black,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: kDarkSecondaryColor,
      foregroundColor: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(foregroundColor: kDarkAccentColor),
  ),
  iconTheme: const IconThemeData(color: kDarkAccentColor),
  inputDecorationTheme: InputDecorationTheme(
    // filled: true,
    // fillColor: Colors.grey[200],
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(50.0),
      borderSide: BorderSide(color: Colors.grey[800]!, width: 1),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: kDarkSecondaryColor),
      borderRadius: BorderRadius.circular(50),
    ),
    iconColor: Colors.grey[400],
    prefixIconColor: Colors.grey[400],
    hintStyle: TextStyle(color: Colors.grey[400]),
  ),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: kDarkSecondaryColor,
    selectionColor: kDarkSecondaryColor,
  ),
  cardTheme: CardThemeData(
    color: kDarkPrimaryColor,
    elevation: 5,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  ),
  progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: kDarkSecondaryColor), // Set the color here
  searchBarTheme: SearchBarThemeData(
    backgroundColor: WidgetStatePropertyAll(
      kDarkPrimaryColor.withOpacity(0.3),
    ),
    textStyle: WidgetStatePropertyAll(const TextStyle(color: Colors.white)),
    hintStyle: WidgetStatePropertyAll(const TextStyle(color: Colors.grey)),
  ),
  chipTheme: ChipThemeData(
    backgroundColor: Colors.grey[800],
    labelStyle: const TextStyle(color: Colors.white),
    secondaryLabelStyle: const TextStyle(color: Colors.black),
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    side: BorderSide.none,
  ),
  dialogTheme: DialogThemeData(
    backgroundColor: kDarkPrimaryColor,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    titleTextStyle: const TextStyle(
        color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
    contentTextStyle: const TextStyle(color: Colors.white70, fontSize: 16),
  ),
  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: kDarkPrimaryColor,
    shape: RoundedRectangleTopBorder(borderRadius: BorderRadius.circular(16)),
  ),
);

class RoundedRectangleTopBorder extends RoundedRectangleBorder {
  const RoundedRectangleTopBorder({
    this.borderRadius = BorderRadius.zero,
    super.side,
  });

  final BorderRadius borderRadius;

  @override
  RoundedRectangleBorder copyWith(
      {BorderSide? side, BorderRadiusGeometry? borderRadius}) {
    return RoundedRectangleTopBorder(
      side: side ?? this.side,
      borderRadius: (borderRadius ?? this.borderRadius) as BorderRadius,
    );
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return Path()
      ..moveTo(rect.topLeft.dx, rect.topLeft.dy + borderRadius.topLeft.y)
      ..quadraticBezierTo(
        rect.topLeft.dx,
        rect.topLeft.dy,
        rect.topLeft.dx + borderRadius.topLeft.x,
        rect.topLeft.dy,
      )
      ..lineTo(rect.topRight.dx - borderRadius.topRight.x, rect.topRight.dy)
      ..quadraticBezierTo(
        rect.topRight.dx,
        rect.topRight.dy,
        rect.topRight.dx,
        rect.topRight.dy + borderRadius.topRight.y,
      )
      ..lineTo(rect.bottomRight.dx, rect.bottomRight.dy)
      ..lineTo(rect.bottomLeft.dx, rect.bottomLeft.dy)
      ..lineTo(rect.topLeft.dx, rect.topLeft.dy + borderRadius.topLeft.y)
      ..close();
  }
}

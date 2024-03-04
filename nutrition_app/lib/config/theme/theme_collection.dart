import 'package:flutter/material.dart';

class ThemeCollection {
  // Generic styles
  static const String _fontFamily = 'Poppins';
  static const TextTheme _textTheme = TextTheme(
    headlineLarge: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
    ),
    headlineSmall: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
    titleMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    titleSmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w400,
    ),
  );

  // Light theme
  static const ColorScheme _lightColorScheme = ColorScheme.light(
    background: Color.fromARGB(255, 244, 248, 254),
    primary: Color.fromARGB(255, 229, 240, 255),
    primaryContainer: Color.fromARGB(255, 245, 249, 255),
    onPrimaryContainer: Color.fromARGB(255, 60, 60, 60),
    secondary: Color(0xff7B6F72),
    secondaryContainer: Color(0xff9DCEFF),
    tertiaryContainer: Color(0xffEEA4CE),
  );
  static final TextTheme _lightTextTheme = _textTheme.merge(
    TextTheme(
      bodyMedium: TextStyle(
        color: _lightColorScheme.secondary,
      ),
    ),
  );
  static ThemeData lightTheme = ThemeData(
    colorScheme: _lightColorScheme,
    textTheme: _lightTextTheme,
    fontFamily: _fontFamily,
    hintColor: const Color.fromARGB(255, 169, 169, 169),
  );

  // Dark theme
  static const ColorScheme _darkColorScheme = ColorScheme.dark(
    background: Color.fromARGB(255, 60, 60, 60),
    primary: Color.fromARGB(255, 26, 98, 140),
    primaryContainer: Color.fromARGB(255, 63, 72, 77),
    onPrimaryContainer: Color.fromARGB(255, 237, 237, 237),
    secondary: Color.fromARGB(255, 255, 228, 207),
    secondaryContainer: Color(0xff9DCEFF),
    tertiaryContainer: Color(0xffEEA4CE),
    shadow: Colors.white,
  );
  static final TextTheme _darkTextTheme = _textTheme.merge(
    TextTheme(
      bodyMedium: TextStyle(
        color: _darkColorScheme.secondary,
      ),
    ),
  );
  static ThemeData darkTheme = ThemeData(
    colorScheme: _darkColorScheme,
    textTheme: _darkTextTheme,
    fontFamily: _fontFamily,
    hintColor: const Color.fromARGB(196, 234, 234, 234),
  );
}

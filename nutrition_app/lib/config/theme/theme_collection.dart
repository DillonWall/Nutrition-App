import 'package:flutter/material.dart';

class ThemeCollection {
  // Generic styles
  static const String _fontFamily = 'Poppins';
  static const TextTheme _textTheme = TextTheme(
    headlineSmall: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
    titleSmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    bodyMedium: TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w400,
    ),
  );

  // Light theme
  static const ColorScheme _lightColorScheme = ColorScheme.light(
    primary: Color.fromARGB(255, 193, 255, 189),
    onPrimaryContainer: Color(0xff7B6F72),
  );
  static final TextTheme _lightTextTheme = _textTheme.merge(
    TextTheme(
      headlineSmall: TextStyle(
        color: _lightColorScheme.onBackground,
      ),
      titleSmall: TextStyle(
        color: _lightColorScheme.onBackground,
      ),
      bodyMedium: TextStyle(
        color: _lightColorScheme.onPrimaryContainer,
      ),
    ),
  );
  static ThemeData lightTheme = ThemeData(
    colorScheme: _lightColorScheme,
    textTheme: _lightTextTheme,
    fontFamily: _fontFamily,
  );

  // Dark theme
  static const ColorScheme _darkColorScheme = ColorScheme.dark(
    primary: Color.fromARGB(255, 118, 221, 83),
    shadow: Colors.white,
    onPrimaryContainer: Color(0xff7B6F72),
  );
  static final TextTheme _darkTextTheme = _textTheme.merge(
    TextTheme(
      headlineSmall: TextStyle(
        color: _darkColorScheme.onBackground,
      ),
      titleSmall: TextStyle(
        color: _darkColorScheme.onBackground,
      ),
      bodyMedium: TextStyle(
        color: _darkColorScheme.onPrimaryContainer,
      ),
    ),
  );
  static ThemeData darkTheme = ThemeData(
    colorScheme: _darkColorScheme,
    textTheme: _darkTextTheme,
    fontFamily: _fontFamily,
  );
}

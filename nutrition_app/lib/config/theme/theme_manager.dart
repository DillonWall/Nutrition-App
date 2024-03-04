import 'dart:async';
import 'package:flutter/material.dart';
import 'package:nutrition_app/config/theme/theme_collection.dart';

class ThemeManager {
  final StreamController<ThemeData> _themeController = StreamController<ThemeData>();
  bool _isDark = false;

  Stream<ThemeData> get theme => _themeController.stream;
  bool get isDark => _isDark;

  // toggleTheme() {
  //   _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
  // }
  void toggleTheme() {
    _isDark = !_isDark;
    applyTheme();
  }

  void applyTheme() {
    // Get the theme to apply
    var themeToApply = isDark ? ThemeCollection.darkTheme : ThemeCollection.lightTheme;
    // Broadcast new theme
    _themeController.add(themeToApply);
  }
}

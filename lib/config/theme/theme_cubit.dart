import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrition_app/config/theme/theme_collection.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit(Object object) : super(ThemeCollection.lightTheme) {
    _emitCurrentTheme();
  }

  Future<void> _saveThemeToPrefs({required ThemeData theme}) async {
    final themeIndex = theme == ThemeCollection.lightTheme ? 0 : 1;
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setInt('theme', themeIndex);
  }

  Future<void> _emitCurrentTheme() async {
    emit(await getThemeFromPrefs());
  }

  Future<ThemeData> getThemeFromPrefs() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final savedThemeIndex = sharedPreferences.getInt('theme') ?? 0;
    final savedTheme =
        savedThemeIndex == 0 ? ThemeCollection.lightTheme : ThemeCollection.darkTheme;
    return savedTheme;
  }

  Future<void> toggleTheme() async {
    ThemeData savedTheme = await getThemeFromPrefs();
    final newTheme = savedTheme == ThemeCollection.lightTheme
        ? ThemeCollection.darkTheme
        : ThemeCollection.lightTheme;
    emit(newTheme);
    _saveThemeToPrefs(theme: newTheme);
  }
}

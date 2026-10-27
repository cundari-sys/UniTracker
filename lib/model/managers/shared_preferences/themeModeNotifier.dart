import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'themeModeNotifier.g.dart';

@riverpod
class ThemeModeNotifier extends _$ThemeModeNotifier {
  static const String _themeKey = 'is_dark_mode';

  @override
  ThemeMode build() {
    _loadThemeFromPrefs();
    return ThemeMode.light; 
  }

  Future<void> _loadThemeFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final isDark = prefs.getBool(_themeKey);
    
    if (isDark != null) {
      state = isDark ? ThemeMode.dark : ThemeMode.light;
    }
  }

  Future<void> toggleTheme() async {
    final prefs = await SharedPreferences.getInstance();
    
    if (state == ThemeMode.dark) {
      state = ThemeMode.light;
      await prefs.setBool(_themeKey, false);
    } else {
      state = ThemeMode.dark;
      await prefs.setBool(_themeKey, true);
    }
  }
}
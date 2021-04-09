import 'package:app_theme_demo/app_theme.dart';
import 'package:app_theme_demo/sharedprf_theme.dart';
import 'package:flutter/material.dart';

class AppThemeProvider extends ChangeNotifier {
  ThemeData _themeData;
  ThemeData get themeData => _themeData;

  AppThemeProvider(int theme) {
    _themeData = AppTheme.getTheme(theme);
    notifyListeners();
  }

  changeTheme(int theme) async {
    _themeData = AppTheme.getTheme(theme);
    await SharedPrfTheme.setTheme(theme);
    notifyListeners();
  }
}

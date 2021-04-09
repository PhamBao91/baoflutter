import 'package:flutter/material.dart';

class AppTheme {
  static final int lightThemeData = 0;
  static final int darkThemeData = 1;

  static ThemeData getTheme(int themeData) {
    if (themeData == darkThemeData) {
      return darkTheme();
    } else {
      return lightTheme();
    }
  }

  static ThemeData lightTheme() {
    return ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        backgroundColor: Colors.white,
        appBarTheme:
            AppBarTheme(backgroundColor: Colors.green, centerTitle: true),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.green, foregroundColor: Colors.white),
        textTheme: lightTextTheme);
  }

  static final TextTheme lightTextTheme = TextTheme(
    headline1: TextStyle(fontSize: 80, color: Color(0xff4a4c4f)),
    headline2: TextStyle(fontSize: 64, color: Color(0xff4a4c4f)),
    headline3: TextStyle(fontSize: 51, color: Color(0xff4a4c4f)),
    headline4: TextStyle(fontSize: 36, color: Color(0xff4a4c4f)),
    headline5: TextStyle(fontSize: 25, color: Color(0xff4a4c4f)),
    headline6: TextStyle(fontSize: 18, color: Color(0xff4a4c4f)),
    subtitle1: TextStyle(fontSize: 17, color: Color(0xff4a4c4f)),
    subtitle2: TextStyle(fontSize: 15, color: Color(0xff4a4c4f)),
    bodyText1: TextStyle(fontSize: 16, color: Color(0xff4a4c4f)),
    bodyText2: TextStyle(fontSize: 14, color: Color(0xff4a4c4f)),
    button: TextStyle(fontSize: 15, color: Color(0xff4a4c4f)),
    caption: TextStyle(fontSize: 13, color: Color(0xff4a4c4f)),
    overline: TextStyle(fontSize: 11, color: Color(0xff4a4c4f)),
  );

  static ThemeData darkTheme() {
    return ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Color(0xff090C24),
        backgroundColor: Color(0xff090C24),
        appBarTheme:
            AppBarTheme(backgroundColor: Color(0xff040511), centerTitle: true),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Color(0xff040511), foregroundColor: Colors.white),
        textTheme: darkTextTheme);
  }

  static final TextTheme darkTextTheme = TextTheme(
    headline1: TextStyle(fontSize: 80, color: Colors.white70),
    headline2: TextStyle(fontSize: 64, color: Colors.white70),
    headline3: TextStyle(fontSize: 51, color: Colors.white70),
    headline4: TextStyle(fontSize: 36, color: Colors.white70),
    headline5: TextStyle(fontSize: 25, color: Colors.white70),
    headline6: TextStyle(fontSize: 18, color: Colors.white70),
    subtitle1: TextStyle(fontSize: 17, color: Colors.white70),
    subtitle2: TextStyle(fontSize: 15, color: Colors.white70),
    bodyText1: TextStyle(fontSize: 16, color: Colors.white70),
    bodyText2: TextStyle(fontSize: 14, color: Colors.white70),
    button: TextStyle(fontSize: 15, color: Colors.white70),
    caption: TextStyle(fontSize: 13, color: Colors.white70),
    overline: TextStyle(fontSize: 11, color: Colors.white70),
  );
}

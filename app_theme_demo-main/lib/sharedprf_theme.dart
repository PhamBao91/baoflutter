import 'package:shared_preferences/shared_preferences.dart';

class SharedPrfTheme {
  static final String themeKey = "APPTHEME";

  static Future<bool> setTheme(int themeData) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setInt(themeKey, themeData);
  }

  static Future<int> getTheme() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getInt(themeKey);
  }
}

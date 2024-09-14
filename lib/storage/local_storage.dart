import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  // save theme in local storage....
  static Future<bool> saveTheme(String theme) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool result = await sharedPreferences.setString('theme', theme);
    return result;
  }

  // get save theme...
  static Future<String?> getTheme() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? currentTheme = sharedPreferences.getString('theme');
    return currentTheme;
  }
}

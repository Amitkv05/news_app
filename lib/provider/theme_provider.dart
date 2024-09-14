import 'package:flutter/material.dart';
import 'package:news_app/storage/local_storage.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  // putting the value into String...
  ThemeProvider(String theme) {
    if (theme == 'light') {
      themeMode = ThemeMode.light;
    } else {
      themeMode = ThemeMode.dark;
    }
  }

  // // Switching theme by clicking.....
  void toggleTheme() async {
    if (themeMode == ThemeMode.light) {
      themeMode = ThemeMode.dark;
      await LocalStorage.saveTheme('dark');
    } else {
      themeMode = ThemeMode.light;
      await LocalStorage.saveTheme('light');
    }
    notifyListeners();
  }
}

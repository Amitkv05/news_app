import 'package:flutter/material.dart';
import 'package:news_app/pages/splash_screen.dart';
import 'package:news_app/provider/theme_provider.dart';
import 'package:news_app/storage/local_storage.dart';
import 'package:news_app/utils/colors.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String currentTheme = await LocalStorage.getTheme() ?? 'dark';
  runApp(MainApp(theme: currentTheme));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key, required this.theme});
  final String theme;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ChangeNotifierProvider<ThemeProvider>(
        create: (context) => ThemeProvider(theme),
        child: Consumer<ThemeProvider>(
          builder: (context, themeProvider, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              themeMode: themeProvider.themeMode,
              theme: ThemeData(
                  primaryColor: Colors.black.withOpacity(0.9),
                  secondaryHeaderColor: Colors.black,
                  brightness: Brightness.light,
                  scaffoldBackgroundColor: Colors.white,
                  appBarTheme: const AppBarTheme(
                      elevation: 0,
                      backgroundColor: Colors.white,
                      iconTheme: IconThemeData(
                        color: Colors.black,
                      ))),
              darkTheme: ThemeData(
                primaryColor: Colors.white,
                secondaryHeaderColor: Colors.white,
                brightness: Brightness.dark,
                scaffoldBackgroundColor: const Color(0xff15161a),
                appBarTheme: const AppBarTheme(
                  elevation: 0,
                  backgroundColor: Color(0xff15161a),
                ),
              ),
              home: const SplashScreen(),
            );
          },
        ),
      ),
    );
    // );
  }
}

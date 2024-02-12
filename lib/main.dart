import 'package:fitflow/app_builder.dart';
import 'package:fitflow/screens/about.dart';
import 'package:fitflow/screens/age.dart';
import 'package:fitflow/screens/goal.dart';
import 'package:fitflow/screens/home.dart';
import 'package:fitflow/screens/landing.dart';
import 'package:fitflow/screens/username.dart';
import 'package:fitflow/screens/weight.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/settings.dart';
import 'utils/constants.dart';

SharedPreferences? prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBuilder(builder: (context) {
      return MaterialApp(
        theme: ThemeData(
            appBarTheme:
                const AppBarTheme(backgroundColor: Colors.deepOrangeAccent),
            textButtonTheme: TextButtonThemeData(
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(
                        Colors.deepOrangeAccent))),
            colorScheme: (prefs?.getBool(Constant.prefDarkTheme) != null &&
                    prefs?.getBool(Constant.prefDarkTheme) == true)
                ? const ColorScheme.dark()
                : const ColorScheme.light()),
        initialRoute: "/",
        routes: {
          "/": (context) => const LandingScreen(),
          "/about": (context) => const AboutScreen(),
          "/age": (context) => const AgeScreen(),
          "/weight": (context) => const WeightScreen(),
          "/goal": (context) => const GoalScreen(),
          "/username": (context) => const UsernameScreen(),
          "/home": (context) => const HomeScreen(),
          "/settings": (context) => const SettingsScreen()
        },
        debugShowCheckedModeBanner: false,
      );
    });
  }
}

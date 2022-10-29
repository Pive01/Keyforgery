import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:keyforgery/screens/MainView.dart';
import 'package:keyforgery/screens/Splash.dart';
import 'package:keyforgery/widgets/MainBottomNavBar.dart';

void main() {
  runApp(SplashScreen(
    key: UniqueKey(),
    onInitializationComplete: () => runMainApp(),
  ));
}

void runMainApp() {
  runApp(MaterialApp(
    title: 'Keyforgery',
    theme: ThemeData(
      brightness: Brightness.light,
    ),
    darkTheme: ThemeData(
      brightness: Brightness.dark,
    ),
    themeMode: ThemeMode.system,
    home: const MainView(),
  ));
}

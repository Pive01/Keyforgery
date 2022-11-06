import 'package:flutter/material.dart';
import 'package:keyforgery/screens/MainView.dart';
import 'package:keyforgery/screens/Splash.dart';
import 'package:keyforgery/utilities/style.dart';

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
    themeMode: ThemeMode.dark,
    home: const MainView(),
  ));
}

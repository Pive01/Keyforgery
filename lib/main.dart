import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:keyforgery/screens/MainView.dart';
import 'package:keyforgery/screens/Splash.dart';

void main() {
  runApp(SplashScreen(
    key: UniqueKey(),
    onInitializationComplete: () => runApp(
        const App(),
    ),
  ));
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  bool useMaterial3 = true;
  ThemeMode themeMode = ThemeMode.system;

  bool get useLightMode {
    switch (themeMode) {
      case ThemeMode.system:
        return SchedulerBinding.instance.window.platformBrightness ==
            Brightness.light;
      case ThemeMode.light:
        return true;
      case ThemeMode.dark:
        return false;
    }
  }

  void handleBrightnessChange(bool useLightMode) {
    setState(() {
      themeMode = useLightMode ? ThemeMode.light : ThemeMode.dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Keyforgery',
      themeMode: themeMode,
      theme: ThemeData(
        colorSchemeSeed: Colors.deepOrange,
        useMaterial3: useMaterial3,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: Colors.deepOrange,
        useMaterial3: useMaterial3,
        brightness: Brightness.dark,
      ),
      home: const MainView(),
    );
  }
}

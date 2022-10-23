import 'package:flutter/material.dart';
import 'package:keyforgery/screens/Home.dart';
import 'package:keyforgery/widgets/MainBottomNavBar.dart';

void main() => runApp(MaterialApp(
      title: 'Keyforgery',
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.system,
      home: const MainBottomNavBar(),
    ));

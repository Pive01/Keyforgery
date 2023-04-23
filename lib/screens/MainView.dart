import 'package:flutter/material.dart';
import 'package:keyforgery/widgets/MainBottomNavBar.dart';

class MainView extends StatelessWidget {
  const MainView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MainBottomNavBar(),
    );
  }
}

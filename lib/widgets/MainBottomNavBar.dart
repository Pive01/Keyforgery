import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keyforgery/screens/Home.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../screens/Add.dart';

class MainBottomNavBar extends StatefulWidget {
  const MainBottomNavBar({Key? key}) : super(key: key);

  @override
  State<MainBottomNavBar> createState() => _MainBottomNavBarState();
}

class _MainBottomNavBarState extends State<MainBottomNavBar> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Home(),
    Add(),
    Scaffold(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        items: [
          BottomNavigationBarItem(
              icon: Icon(_selectedIndex == 0
                  ? MdiIcons.homeVariant
                  : MdiIcons.homeVariantOutline),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                  _selectedIndex == 1 ? Icons.add_box : Icons.add_box_outlined),
              label: 'Add'),
          BottomNavigationBarItem(
              icon: Icon(_selectedIndex == 2
                  ? MdiIcons.gamepadVariant
                  : MdiIcons.gamepadVariantOutline),
              label: 'Play'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

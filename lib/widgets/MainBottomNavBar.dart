import 'package:flutter/material.dart';
import 'package:keyforgery/screens/Home/Home.dart';
import 'package:keyforgery/screens/Settings.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../screens/Search.dart';

class MainBottomNavBar extends StatefulWidget {
  const MainBottomNavBar({Key? key}) : super(key: key);

  @override
  State<MainBottomNavBar> createState() => _MainBottomNavBarState();
}

class _MainBottomNavBarState extends State<MainBottomNavBar> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        Home(),
        const Search(),
        const Scaffold(),
        const Settings(),
      ][_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: const <NavigationDestination>[
          NavigationDestination(
            selectedIcon: Icon(MdiIcons.homeVariant),
            icon: Icon(MdiIcons.homeVariantOutline),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.search),
            icon: Icon(Icons.search_outlined),
            label: 'Search',
          ),
          NavigationDestination(
            selectedIcon: Icon(MdiIcons.viewDashboard),
            icon: Icon(MdiIcons.viewDashboardOutline),
            label: 'Groups',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.settings),
            icon: Icon(Icons.settings_outlined),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

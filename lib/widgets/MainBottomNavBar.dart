import 'package:flutter/material.dart';
import 'package:keyforgery/screens/Home.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../screens/Search.dart';

class MainBottomNavBar extends StatefulWidget {
  const MainBottomNavBar({Key? key}) : super(key: key);

  @override
  State<MainBottomNavBar> createState() => _MainBottomNavBarState();
}

class _MainBottomNavBarState extends State<MainBottomNavBar> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Home(),
    Search(),
    Scaffold(),
    Scaffold(),
  ];

  void setPage(int index) {
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
        backgroundColor: Theme.of(context).primaryColor,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor:Colors.white,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
              icon: Icon(_selectedIndex == 0
                  ? MdiIcons.homeVariant
                  : MdiIcons.homeVariantOutline),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                  _selectedIndex == 1 ? Icons.search : Icons.search_outlined),
              label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(_selectedIndex == 2
                  ? MdiIcons.viewDashboard
                  : MdiIcons.viewDashboardOutline),
              label: 'Groups'),
          BottomNavigationBarItem(
              icon: Icon(_selectedIndex == 3
                  ? Icons.settings
                  : Icons.settings_outlined),
              label: 'Settings'),
        ],
        currentIndex: _selectedIndex,
        onTap: setPage,
      ),
    );
  }
}

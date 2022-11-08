import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

import 'DataTransfer.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
      ),
      body: SettingsList(
        darkTheme: SettingsThemeData(
          settingsListBackground: Theme.of(context).primaryColor,
        ),
        sections: [
          SettingsSection(
            title: const Text("General"),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                leading: const Icon(Icons.lightbulb_outlined),
                title: const Text('Dark mode'),
              ),
              SettingsTile.navigation(
                leading: const Icon(Icons.import_export),
                title: const Text('Data Transfer'),
                onPressed: (BuildContext context) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DataTransfer()),
                  );
                },
              ),
              SettingsTile.switchTile(
                onToggle: (value) {},
                initialValue: true,
                leading: Icon(Icons.format_paint),
                title: Text('Enable custom theme'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

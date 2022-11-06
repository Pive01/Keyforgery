import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 40),
        child: SettingsList(
          sections: [
            SettingsSection(
              title: IconButton(
                  onPressed: (() => Navigator.pop(context)),
                  icon: Icon(Icons.arrow_back)),
              tiles: <SettingsTile>[
                SettingsTile.navigation(
                  leading: Icon(Icons.lightbulb_outlined),
                  title: Text('Dark mode'),
                  value: Text('English'),
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
      ),
    );
  }
}

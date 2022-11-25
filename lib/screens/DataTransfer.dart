import 'package:flutter/material.dart';
import 'package:keyforgery/data/api/ApiPerformer.dart';
import 'package:keyforgery/screens/LoginPage.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:settings_ui/settings_ui.dart';

class DataTransfer extends StatelessWidget {
  const DataTransfer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        leading: const BackButton(),
      ),
      body: SettingsList(
          darkTheme: SettingsThemeData(
            settingsListBackground: Theme.of(context).primaryColor,
          ),
          sections: [
            SettingsSection(
              title: const Text("Decks Of Keyforge"),
              tiles: <SettingsTile>[
                SettingsTile.navigation(
                  leading: const Icon(Icons.library_add),
                  title: const Text('Import'),
                  description: const Text("Import decks and add them to your library"),
                  onPressed: (BuildContext context) {
                    triggerOnLogin(context, "Decks Of Keyforge", ApiPerformer.importDokDecks,false);
                  },
                ),
                SettingsTile.navigation(
                  leading: const Icon(Icons.upload),
                  title: const Text('Upload'),
                  description: const Text("Upload decks in your library to DoK "),
                ),
              ],
            ),
            SettingsSection(
              title: const Text("TheCrucible"),
              tiles: <SettingsTile>[
                SettingsTile.navigation(
                  leading: const Icon(MdiIcons.fileReplace),
                  title: const Text('Override Import'),
                  description: const Text("Import decks and replace current w/l "),
                  onPressed: (BuildContext context) {
                    triggerOnLogin(context, "TheCrucible", ApiPerformer.overrideCrucibleImports,true);
                  },
                ),
                SettingsTile.navigation(
                  leading: const Icon(Icons.library_add),
                  title: const Text('Add Import'),
                  description: const Text("Import decks and add imported w/l with current w/l "),
                  onPressed: (BuildContext context) {
                    triggerOnLogin(context, "TheCrucible", ApiPerformer.addCrucibleImports,true);
                  },
                ),
              ],
            ),
            SettingsSection(
              title: const Text("MasterVault"),
              tiles: <SettingsTile>[
                SettingsTile.navigation(
                  leading: const Icon(Icons.library_add),
                  title: const Text('Import'),
                  description: const Text("Add MasterVault decks to your library"),
                ),
              ],
            ),
          ]),
    );
  }
}

void triggerOnLogin(BuildContext context, String textHeader, Function apiExecute, bool showCheck) {
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => LoginPage(
                headerText: textHeader,
                callback: (String username, String password, bool isChecked) async {
                  Navigator.pop(context);
                  dynamic contextToPop;
                  showDialog<String>(
                      context: context,
                      builder: (BuildContext context) {
                        contextToPop = context;
                        return AlertDialog(
                          actions: <Widget>[
                            Row(
                              children: const [Padding(padding: EdgeInsets.only(left: 8,top: 8,bottom: 8,right: 20), child: CircularProgressIndicator()), Text
                                ("Loading")],
                            )
                          ],
                        );
                      });
                  if(showCheck) {
                    await apiExecute(username, password, isChecked);
                  } else {
                    await apiExecute(username, password);
                  }
                  Navigator.pop(contextToPop);
                },
              )));
}

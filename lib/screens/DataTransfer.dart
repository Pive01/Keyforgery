import 'package:flutter/cupertino.dart';
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
                  description:
                      const Text("Import decks and add them to your library"),
                ),
                SettingsTile.navigation(
                  leading: const Icon(Icons.upload),
                  title: const Text('Upload'),
                  description:
                      const Text("Upload decks in your library to DoK "),
                ),
              ],
            ),
            SettingsSection(
              title: const Text("TheCrucible"),
              tiles: <SettingsTile>[
                SettingsTile.navigation(
                  leading: const Icon(MdiIcons.fileReplace),
                  title: const Text('Override Import'),
                  description:
                      const Text("Import decks and replace current w/l "),
                  onPressed: (BuildContext context) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LoginPage(
                                headerText: "TheCrucible",
                                callback:
                                    (String username, String password) async {
                                  Navigator.pop(context);
                                  dynamic context_to_pop;
                                  showDialog<String>(
                                      context: context,
                                      builder: (BuildContext context) {
                                        context_to_pop = context;
                                        return const AlertDialog(
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(32.0))),
                                          title: Text('Getting data'),
                                          actions: <Widget>[
                                            Align(
                                                alignment: Alignment.center,
                                                child: Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child:
                                                      CircularProgressIndicator(),
                                                ))
                                          ],
                                        );
                                      });
                                  await ApiPerformer.overrideCrucibleImports(
                                      username, password);
                                  Navigator.pop(context_to_pop);
                                },
                              )),
                    );
                  },
                ),
                SettingsTile.navigation(
                  leading: const Icon(Icons.library_add),
                  title: const Text('Add Import'),
                  description: const Text(
                      "Import decks and add imported w/l with current w/l "),
                  onPressed:  (BuildContext context) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LoginPage(
                            headerText: "TheCrucible",
                            callback:
                                (String username, String password) async {
                              Navigator.pop(context);
                              dynamic context_to_pop;
                              showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) {
                                    context_to_pop = context;
                                    return const AlertDialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(32.0))),
                                      title: Text('Getting data'),
                                      actions: <Widget>[
                                        Align(
                                            alignment: Alignment.center,
                                            child: Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child:
                                              CircularProgressIndicator(),
                                            ))
                                      ],
                                    );
                                  });
                              await ApiPerformer.addCrucibleImports(
                                  username, password);
                              Navigator.pop(context_to_pop);
                            },
                          )),
                    );
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
                  description:
                      const Text("Add MasterVault decks to your library"),
                ),
              ],
            ),
          ]),
    );
  }
}

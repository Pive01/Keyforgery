import 'package:flutter/material.dart';
import 'package:keyforgery/data/models/Expansion/Expansion.dart';
import 'package:keyforgery/utilities/utils.dart';
import 'package:keyforgery/widgets/DeckDisplayer/HouseLogoDisplay.dart';

import '../../data/models/House/House.dart';
import '../../utilities/DataMantainer.dart';
import '../../widgets/ExpansionLogoDisplay.dart';

createFilterDialog(BuildContext context, Function callback) {
  return showDialog(
      context: context,
      builder: (BuildContext context) => Dialog.fullscreen(
              child: Filter(
            callback: callback,
          )));
}

class Filter extends StatefulWidget {
  const Filter({super.key, required this.callback});

  final Function callback;

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  List<House> houseList = DataMantainer.getHousesInfo()
      .data
      .where((element) => element.id != "The Tide")
      .toList();
  List<Expansion> expansionList = DataMantainer.getExpansionsInfo();
  List<String> filterHouses = [];
  List<String> filterExpansions = [];
  String deckFilter = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.close)),
          title: const Text(
            'Filter Decks',
            textAlign: TextAlign.right,
            overflow: TextOverflow.ellipsis,
          ),
          actions: [
            TextButton(
              onPressed: () {
                widget.callback(
                    deckFilter,
                    filterHouses.map((e) => e.makeKfFriendly()).toList(),
                    filterExpansions
                        .map((e) => e.toUpperCase().replaceAll(" ", "_"))
                        .toList());
                Navigator.pop(context);
              },
              child: const Text(
                'Save',
                textAlign: TextAlign.right,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ]),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(height: 5),
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Deck Name',
                ),
                onChanged: (String text) => setState(() {
                  deckFilter = text;
                }),
              ),
              const SizedBox(height: 10),
              ExpansionTile(
                maintainState: true,
                title: const Text("Houses"),
                children: [
                  GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      childAspectRatio: 5,
                      children: List.generate(houseList.length, (i) {
                        return Row(
                          children: [
                            Checkbox(
                                value: filterHouses.contains(houseList[i].name),
                                onChanged: (value) => {
                                      setState(() {
                                        if (value ?? false) {
                                          filterHouses.add(houseList[i].name);
                                        } else {
                                          filterHouses
                                              .remove(houseList[i].name);
                                        }
                                      })
                                    }),
                            HouseLogoDisplay(
                              name: houseList[i].name.makeKfFriendly(),
                              size: 30,
                            ),
                            Text(houseList[i].name)
                          ],
                        );
                      }))
                ],
              ),
              ExpansionTile(
                title: const Text("Expansions"),
                children: [
                  GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      childAspectRatio: 5,
                      children: List.generate(expansionList.length, (i) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Checkbox(
                                value: filterExpansions
                                    .contains(expansionList[i].name),
                                onChanged: (value) => {
                                      setState(() {
                                        if (value ?? false) {
                                          filterExpansions
                                              .add(expansionList[i].name);
                                        } else {
                                          filterExpansions
                                              .remove(expansionList[i].name);
                                        }
                                        print(filterExpansions);
                                      })
                                    }),
                            ExpansionLogoDisplay(
                                name: DataMantainer.getExpansionLogoFromName(
                                    expansionList[i].name),
                                size: 25),
                            Flexible(
                              child: Text(
                                expansionList[i].name,
                                overflow: TextOverflow.fade,
                                softWrap: false,
                              ),
                            )
                          ],
                        );
                      }))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

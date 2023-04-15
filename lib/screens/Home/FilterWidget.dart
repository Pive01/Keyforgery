import 'package:flutter/material.dart';
import 'package:keyforgery/data/models/Expansion/Expansion.dart';
import 'package:keyforgery/widgets/DeckDisplayer/HouseLogoDisplay.dart';

import '../../data/models/House/House.dart';
import '../../utilities/DataMantainer.dart';
import '../../widgets/ExpansionLogoDisplay.dart';

createFilterDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) => const Dialog.fullscreen(
            child: Filter(),
          ));
}

class Filter extends StatefulWidget {
  const Filter({Key? key}) : super(key: key);

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  List<House> houseList = LogoConverter.getHousesInfo()
      .data
      .where((element) => element.id != "The Tide")
      .toList();
  List<Expansion> expansionList = LogoConverter.getExpansionsInfo();
  List<String> filterHouses = [];
  List<String> filterExpansions = [];

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
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Deck Name',
                ),
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
                                          filterHouses.remove(houseList[i].name);
                                        }
                                      })
                                    }),
                            HouseLogoDisplay(link: houseList[i].image!, size: 30),
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
                                    .contains(expansionList[i].expansion),
                                onChanged: (value) => {
                                      setState(() {
                                        if (value ?? false) {
                                          filterExpansions
                                              .add(expansionList[i].expansion);
                                        } else {
                                          filterExpansions
                                              .remove(expansionList[i].expansion);
                                        }
                                      })
                                    }),
                            ExpansionLogoDisplay(
                                link: expansionList[i].image, size: 25),
                            Flexible(
                              child: Text(
                                expansionList[i].expansion,
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

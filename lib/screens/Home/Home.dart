import 'package:flutter/material.dart' hide Card;
import 'package:keyforgery/screens/DeckInfo.dart';
import 'package:keyforgery/utilities/utils.dart';
import 'package:keyforgery/widgets/DeckDisplayer/HouseLogoDisplay.dart';

import '../../data/models/DeckModel/Deck/Deck.dart';
import '../../data/storage/Database/DecksDatabase.dart';
import '../../utilities/DataMantainer.dart';
import '../../widgets/DeckList.dart';
import '../../widgets/ExpansionLogoDisplay.dart';
import 'DeckSearchDelegate.dart';
import 'FilterWidget.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final deckDao = DecksDatabase.getSyncDB().deckDao;
  String searchTerm = "";
  String activeSearchTerm = "";
  List<String> filterHouses = [];
  List<String> filterExpansions = [];
  List<bool> filterActive = [false, true, true, true];
  List<bool> filterShow = [false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              String? filterValue = await showSearch(
                  context: context,
                  delegate: DeckSearchDelegate(
                      callback: (Deck deck) => () {
                            Navigator.pop(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DeckInfo(deck: deck)));
                          },
                      deckDao: deckDao));

              setState(() {
                searchTerm = filterValue?.toLowerCase() ?? "";
              });
            },
            icon: const Icon(Icons.search),
          ),
          IconButton(
              onPressed: () => createFilterDialog(context, (String deckName,
                      List<String> houses, List<String> expansions) {
                    setState(() {
                      searchTerm = deckName;
                      filterHouses = houses;
                      filterExpansions = expansions;
                      filterActive = [
                        true,
                        deckName != "",
                        houses.isNotEmpty,
                        expansions.isNotEmpty
                      ];
                      filterShow = [
                        deckName != "",
                        houses.isNotEmpty,
                        expansions.isNotEmpty
                      ];
                    });
                  }),
              icon: const Icon(Icons.filter_list_outlined))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: filterActive[0]
                  ? Row(
                      //TODO wrap this logic in a single widget and make it reusable for all 3
                      children: [
                        IconButton(
                            onPressed: () => setState(() {
                                  filterActive[0] = false;
                                }),
                            icon: const Icon(Icons.close)),
                        filterShow[0]
                            ? FilterChip(
                                label: Text(searchTerm),
                                avatar: const Icon(Icons.check_rounded,
                                    color: Colors.white),
                                backgroundColor: filterActive[1]
                                    ? Theme.of(context)
                                        .colorScheme
                                        .inversePrimary
                                    : Theme.of(context).colorScheme.background,
                                onSelected: (active) => setState(() {
                                      filterActive[1] = !filterActive[1];
                                    }))
                            : const SizedBox.shrink(),
                        const SizedBox(width: 10),
                        filterShow[1]
                            ? FilterChip(
                                avatar: const Icon(Icons.check_rounded,
                                    color: Colors.white),
                                backgroundColor: filterActive[2]
                                    ? Theme.of(context)
                                        .colorScheme
                                        .inversePrimary
                                    : Theme.of(context).colorScheme.background,
                                padding:
                                    const EdgeInsets.only(left: 2, right: 2),
                                label: SizedBox(
                                  height: 37,
                                  child: GridView.count(
                                      shrinkWrap: true,
                                      crossAxisCount: 1,
                                      childAspectRatio: 1,
                                      scrollDirection: Axis.horizontal,
                                      children: List.generate(
                                          filterHouses.length, (i) {
                                        return HouseLogoDisplay(
                                          name: filterHouses[i],
                                          size: 300,
                                        );
                                      })),
                                ),
                                onSelected: (active) => setState(() {
                                      filterActive[2] = !filterActive[2];
                                    }))
                            : const SizedBox.shrink(),
                        const SizedBox(width: 10),
                        filterShow[2]
                            ? FilterChip(
                                avatar: const Icon(Icons.check_rounded,
                                    color: Colors.white),
                                backgroundColor: filterActive[3]
                                    ? Theme.of(context)
                                        .colorScheme
                                        .inversePrimary
                                    : Theme.of(context).colorScheme.background,
                                padding:
                                    const EdgeInsets.only(left: 2, right: 2),
                                label: SizedBox(
                                  height: 37,
                                  child: GridView.count(
                                      shrinkWrap: true,
                                      crossAxisCount: 1,
                                      childAspectRatio: 1,
                                      scrollDirection: Axis.horizontal,
                                      children: List.generate(
                                          filterExpansions.length, (i) {
                                        return ExpansionLogoDisplay(
                                            name: DataMantainer
                                                .getExpansionLogoFromName(
                                                    filterExpansions[i]),
                                            size: 300);
                                      })),
                                ),
                                onSelected: (active) => setState(() {
                                      filterActive[3] = !filterActive[3];
                                    }))
                            : const SizedBox.shrink(),
                      ],
                    )
                  : const SizedBox.shrink(),
            ),
            StreamBuilder<List<Deck>>(
                stream: deckDao.getDecksAsStream(),
                builder: (context, snapshot) {
                  return DeckList(
                    deckList: getFilteredDecks(snapshot),
                    callback: (Deck selectedDeck) => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DeckInfo(deck: selectedDeck))),
                    },
                  );
                }),
          ],
        ),
      ),
    );
  }

  List<Deck> getFilteredDecks(AsyncSnapshot<List<Deck>> snapshot) {
    List<Deck> tempDecks = snapshot.data ?? [];

    if (!filterActive[0]) {
      return tempDecks;
    } else {
      if (filterActive[1]) {
        tempDecks = tempDecks
            .where((element) =>
                element.name.toLowerCase().contains(searchTerm.toLowerCase()))
            .toList();
      }
      if (filterActive[2]) {
        if (filterHouses.length > 3) {
          tempDecks = tempDecks
              .where((element) => element.housesAndCards
                  .any((e) => filterHouses.contains(e.house.makeKfFriendly())))
              .toList();
        } else {
          tempDecks = tempDecks
              .where((element) => filterHouses.every((e) => element
                  .housesAndCards
                  .any((deckHouse) => e == deckHouse.house)))
              .toList();
        }
      }
      if (filterActive[3]) {
        tempDecks = tempDecks
            .where((element) => filterExpansions.contains(element.expansion))
            .toList();
      }

      return tempDecks;
    }
  }
}

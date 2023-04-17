import 'package:flutter/material.dart' hide Card;
import 'package:keyforgery/screens/DeckInfo.dart';

import '../../data/api/Api.dart';
import '../../data/models/CardsDeckRef.dart';
import '../../data/models/DeckModel/Deck/Deck.dart';
import '../../data/models/Card/Card/Card.dart';
import '../../data/models/Wrappers/MasterVaultWrappers/linkCards/MVCardsWrapper/MVCardsWrapper.dart';
import '../../data/storage/Database/DecksDatabase.dart';
import '../../widgets/DeckList.dart';
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
                      callback: (Deck deck) => (){
                        Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => DeckInfo(deck: deck)));
                      }, deckDao: deckDao)
              );

              WidgetsBinding.instance.addPostFrameCallback((_){
                setState(() {
                  searchTerm = filterValue ?? "";
                });
              });

            },
            icon: const Icon(Icons.search),
          ),
          IconButton(onPressed: () => createFilterDialog(context), icon: const Icon(Icons.filter_list_outlined))
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () => testBtn()),
      body: StreamBuilder<List<Deck>>(
          stream: deckDao.getDecksAsStream(),
          builder: (context, snapshot) {
            return DeckList(
              deckList: snapshot.data?.where((element) => element.name.contains(searchTerm)).toList() ?? [],
              callback: (Deck selectedDeck) => {
                Navigator.push(context, MaterialPageRoute(builder: (context) => DeckInfo(deck: selectedDeck))),
              },
              callbackLong: (Deck deck) => showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(32.0))),
                  title: const Text('Remove from library'),
                  content: Text(deck.name),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        deckDao.deleteDeck(deck).then(
                              (value) => Navigator.pop(context, 'Removed'),
                            );
                      },
                      child: const Text('Remove'),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}

Future<void> testBtn() async {
  MVCardsWrapper wrapper = await Api.getCards("35901d31-5761-4f27-bd94-3b698c59d89f");
  List<Card> shortedCardList = wrapper.linked.cards;
  List<String> fullCardList = wrapper.data.links.cards;
  shortedCardList.removeWhere((element) => element.id == "37377d67-2916-4d45-b193-bea6ecd853e3"); //remove tide card
  List<CardsDeckRef> finalList = shortedCardList
      .map((e) => CardsDeckRef(e.id, 124124, fullCardList.map((cardId) => cardId == e.id ? 1 : 0).reduce((value, element) => value + element), e.is_maverick,
          wrapper.data.set_era_cards.Legacy.any((element) => element == e.id), e.is_anomaly, e.is_enhanced))
      .toList();
  int count = 0;
  for(CardsDeckRef c in finalList){
    count += c.count;
  }
  print(count);
}

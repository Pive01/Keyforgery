import 'package:flutter/material.dart';
import 'package:keyforgery/data/models/Wrappers/TheCrucibleWrapper/TokenWrapper/RefreshToken.dart';
import 'package:keyforgery/screens/DeckInfo.dart';
import 'package:keyforgery/utilities/utils.dart';

import '../data/models/DeckModel/Deck/Deck.dart';
import '../data/storage/Database/DecksDatabase.dart';
import '../utilities/style.dart';
import '../widgets/DeckList.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final deckDao = DecksDatabase.getSyncDB().deckDao;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent.withOpacity(0),
        elevation: 0,
        title: Text('KEYFORGERY',
            style: Theme.of(context).brightness == Brightness.dark
                ? textFontBold
                : textFontBoldDark),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () async {
        await SharedPrefs.setRefreshToken(RefreshToken(3, "a", "b"));
        SharedPrefs.getRefreshToken().then((value) => print(value));
      }),
      body: StreamBuilder<List<Deck>>(
          stream: deckDao.getDecksAsStream(),
          builder: (context, snapshot) {
            return DeckList(
              deckList: snapshot.data ?? [],
              callback: (Deck selectedDeck) => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DeckInfo(deck: selectedDeck))),
              },
              callbackLong: (Deck deck) => showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32.0))),
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

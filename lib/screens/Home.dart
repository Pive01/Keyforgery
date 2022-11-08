import 'package:flutter/material.dart';
import 'package:keyforgery/data/api/Api.dart';
import 'package:keyforgery/data/models/Wrappers/TheCrucibleWrapper/CrucibleDecksWrapper/CrucibleDecksWrapper.dart';
import 'package:keyforgery/data/models/Wrappers/TheCrucibleWrapper/TokenWrapper/TokenWrapper.dart';
import 'package:keyforgery/screens/DeckInfo.dart';

import '../data/models/DeckModel/Deck/Deck.dart';
import '../data/models/Validator/CrucibleLogin.dart';
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
        TokenWrapper token =
            await Api.getCrucibleToken(CrucibleLogin('Pive', 'Ciaolol123'));
        Deck deck;
        CrucibleDecksWrapper cDecks =
            await Api.getCrucibleDecks("Bearer ${token.token}");
        cDecks.decks.forEach((element) {
          Api.getDeckById(element.uuid).then((value) {
            deck = value.deck;
            deck.localWins = int.parse(element.wins);
            deck.localLosses = int.parse(element.losses);
            deckDao.addDeck(deck);
          });
        });
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

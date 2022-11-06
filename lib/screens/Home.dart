import 'package:flutter/material.dart';

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
  final database = DecksDatabase.getSyncDB();

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
      body: StreamBuilder<List<Deck>>(
          stream: database.deckDao.getDecks(),
          builder: (context, snapshot) {
            return DeckList(
              deckList: snapshot.data ?? [],
            );
          }),
    );
  }
}

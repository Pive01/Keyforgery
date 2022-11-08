import 'package:flutter/material.dart';
import 'package:keyforgery/data/api/Api.dart';
import 'package:keyforgery/data/storage/Database/DecksDatabase.dart';
import 'package:keyforgery/widgets/DeckList.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

import '../data/models/DeckModel/Deck/Deck.dart';
import '../data/models/Wrappers/DokWrappers/DokFilterWrappers/ReqBody/GetDecksReqBody/GetDecksReqBody.dart';
import 'Home.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<Deck> deckList = [];
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: Colors.redAccent.withOpacity(0),
              elevation: 0,
              forceElevated: innerBoxIsScrolled,
              title: Padding(
                padding: const EdgeInsets.all(5),
                child: TextField(
                  onSubmitted: (query) {
                    setState(() {
                      isLoading = true;
                    });
                    Api.getDecksByName(GetDecksReqBody(title: query)).then((value) {
                      setState(() {
                        isLoading = false;
                        deckList = value.decks;
                      });
                    }, onError: (e) {
                      print("error");
                      print(e.toString());
                    });
                  },
                  decoration: InputDecoration(
                    filled: true,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 15.0),
                    hintText: "Search...",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(45.0), borderSide: BorderSide.none),
                    suffixIcon: const Icon(Icons.search),
                  ),
                ),
              ),
            )
          ];
        },
        body: isLoading
            ? const Align(
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              )
            : DeckList(
                deckList: deckList,
                callback: (Deck deck) => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(32.0))),
                    title: const Text('Add to library'),
                    content: Text(deck.name),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          final database = DecksDatabase.getSyncDB();
                          final decksDao = database.deckDao;
                          decksDao.addDeck(deck).then(
                                (value) => Navigator.pop(context, 'Added'),
                              );
                        },
                        child: const Text('Add'),
                      ),
                    ],
                  ),
                ),
                callbackLong: () {},
              ),
      ),
    );
  }
}

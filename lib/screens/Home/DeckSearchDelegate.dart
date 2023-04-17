import 'package:flutter/material.dart';

import '../../data/models/DeckModel/Deck/Deck.dart';
import '../../data/storage/Deck/DeckDao.dart';

class DeckSearchDelegate extends SearchDelegate<String> {
  Function callback;
  DeckDao deckDao;

  DeckSearchDelegate({required this.callback, required this.deckDao});

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, "");
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const SizedBox();
  }

  @override
  void showResults(BuildContext context) {
    close(context, query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return StreamBuilder<List<Deck>>(
        stream: deckDao.getDecksAsStream(),
        builder: (context, snapshot) {
          List<Deck> searchTerms = snapshot.data ?? [];
          List<Deck> matchQuery = [];
          for (var terms in searchTerms) {
            if (terms.name.toLowerCase().contains(query.toLowerCase())) {
              matchQuery.add(terms);
            }
          }
          return ListView.builder(
            itemCount: matchQuery.length,
            itemBuilder: (context, index) {
              var result = matchQuery[index];
              return GestureDetector(
                onTap: callback(result),
                child: ListTile(
                  title: Text(result.name),
                ),
              );
            },
          );
        });
  }
}

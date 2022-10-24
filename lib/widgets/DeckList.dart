import 'package:flutter/cupertino.dart';

import '../data/models/DeckModel/Deck/Deck.dart';
import 'DeckDisplayer/DeckDisplayer.dart';

class DeckList extends StatefulWidget {
  const DeckList({super.key, required this.deckList});

  final List<Deck> deckList;

  @override
  State<DeckList> createState() => _DeckListState();
}

class _DeckListState extends State<DeckList> {
  @override
  Widget build(BuildContext context) {
    return widget.deckList.isNotEmpty ?
    ListView.separated(
      padding: const EdgeInsets.only(top: 2, left: 5, right: 5),
      itemBuilder: (context, position) {
        return DeckDisplayer(deck:widget.deckList.elementAt(position));
      },
      itemCount: widget.deckList.length,
      separatorBuilder: (context, index) => const SizedBox(
        height: 10,
      ),
    ) :
        const Center(
          child: Text('Nothing to display here'),
        )
    ;
  }
}

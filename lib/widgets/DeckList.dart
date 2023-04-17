import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data/models/DeckModel/Deck/Deck.dart';
import 'DeckDisplayer/DeckDisplayer.dart';

class DeckList extends StatefulWidget {
  const DeckList(
      {super.key, required this.deckList, this.callback, this.callbackLong});

  final List<Deck> deckList;
  final callback;
  final callbackLong;

  @override
  State<DeckList> createState() => _DeckListState();
}

class _DeckListState extends State<DeckList> {

  @override
  Widget build(BuildContext context) {
    return widget.deckList.isNotEmpty
        ? ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.only(top: 2),
            itemBuilder: (context, position) {
              return DeckDisplayer(
                deck: widget.deckList.elementAt(position),
                callBack: widget.callback,
                callBackLong: widget.callbackLong,
              );
            },
            itemCount: widget.deckList.length,
            separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
          )
        : const Center(
            child: Text('Nothing to display here'),
          );
  }
}

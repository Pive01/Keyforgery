import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data/models/DeckModel/Deck/Deck.dart';
import 'DeckDisplayer/DeckDisplayer.dart';

class DeckList extends StatefulWidget {
  const DeckList({super.key, required this.deckList, this.callback});

  final List<Deck> deckList;
  final callback;

  @override
  State<DeckList> createState() => _DeckListState();
}

class _DeckListState extends State<DeckList> {

  List<Deck> removedDecks = [];

  @override
  Widget build(BuildContext context) {
    return widget.deckList.isNotEmpty
        ? ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.only(top: 2),
        itemBuilder: (context, position) {
          return Dismissible(
              direction: DismissDirection.endToStart,
              background: const ColoredBox(
                  color: Colors.redAccent,
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: 12.0),
                        child: Icon(Icons.delete),
                      ))),
              key: Key(widget.deckList
                  .elementAt(position)
                  .id
                  .toString()),
              onDismissed: (direction) {
                setState(() {
                  removedDecks.add(widget.deckList.elementAt(position));
                });
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                      "Removed ${widget.deckList
                          .elementAt(position)
                          .name}",
                      overflow: TextOverflow.fade),
                  action: SnackBarAction(
                    label: 'Undo',
                    onPressed: () {},
                  ),
                ));
              },
              child: DeckDisplayer(
          deck: widget.deckList.elementAt(position),
          callBack: widget.callback,
          ),
          );
        },
        itemCount: widget.deckList.length,
        separatorBuilder: (context, index) => const Divider(height: 1,)
    )
        : const Center(
      child: Text('Nothing to display here'),
    );
  }
}

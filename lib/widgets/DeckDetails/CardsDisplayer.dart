import 'package:flutter/material.dart';
import 'package:keyforgery/utilities/utils.dart';
import 'package:keyforgery/widgets/DeckDetails/CardList.dart';

import '../../data/models/Card/Card/RetrievedCard.dart';
import '../../data/models/DeckModel/Deck/Deck.dart';
import '../../utilities/DataMantainer.dart';
import '../DeckDisplayer/HouseLogoDisplay.dart';

class CardDisplayer extends StatefulWidget {
  final Deck deck;
  final List<RetrievedCard> cardList;

  const CardDisplayer({Key? key, required this.deck, required this.cardList}) : super(key: key);

  @override
  State<CardDisplayer> createState() => _CardDisplayerState();
}

class _CardDisplayerState extends State<CardDisplayer> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 10,
          backgroundColor: Colors.redAccent.withOpacity(0),
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                  flex: 1,
                  child: TabBar(
                      tabs: widget.deck.housesAndCards
                          .map((e) => Tab(
                                  child: HouseLogoDisplay(
                                link: LogoConverter.getLinkFromName(e.house),
                                size: 70,
                              )))
                          .toList()))
            ],
          ),
          automaticallyImplyLeading: false,
        ),
        body: Container(
          color: Colors.redAccent.withOpacity(0),
          child: TabBarView(children: widget.deck.housesAndCards.map((e) => CardList(cardList: widget.cardList, house: e.house.makeKfFriendly())).toList()),
        ),
      ),
    );
  }
}

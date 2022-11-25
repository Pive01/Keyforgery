import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keyforgery/widgets/DeckDetails/CardList.dart';

import '../../data/models/Card/Card/RetrivedCard.dart';
import '../../data/models/DeckModel/Deck/Deck.dart';
import '../../utilities/LogoConverte.dart';
import '../DeckDisplayer/HouseLogoDisplay.dart';

class CardDisplayer extends StatefulWidget {
  final Deck deck;
  final List<RetrivedCard> cardList;
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
                Expanded(flex:1,child: TabBar(tabs: widget.deck.housesAndCards.map((e) => Tab(child: HouseLogoDisplay(link: LogoConverter.getLinkFromName(e
                    .house)))).toList()))
              ],
            ),
            automaticallyImplyLeading: false,
          ),
          body: Container(
            height: 400,
            color: Colors.blue,
            child: TabBarView(children: widget.deck.housesAndCards.map((e) => CardList(cardList: widget.cardList.where((element) => element.house==e.house)
                .toList())).toList()),
          ),
        ));
  }
}

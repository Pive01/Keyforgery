import 'package:flutter/material.dart' hide Card;
import 'package:keyforgery/data/api/ApiPerformer.dart';
import 'package:keyforgery/data/models/Card/Card/RetrievedCard.dart';
import 'package:keyforgery/data/storage/Database/DecksDatabase.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../data/models/DeckModel/Deck/Deck.dart';
import '../utilities/style.dart';
import '../widgets/DeckDetails/CardsDisplayer.dart';
import '../widgets/DeckDetails/ModalBottomSheet.dart';

class DeckInfo extends StatefulWidget {
  final Deck deck;
  late final DecksDatabase database;

  DeckInfo({Key? key, required this.deck}) : super(key: key) {
    database = DecksDatabase.getSyncDB();
  }

  @override
  State<DeckInfo> createState() => _DeckInfoState();
}

class _DeckInfoState extends State<DeckInfo> {
  @override
  void initState() {
    super.initState();
    deck = widget.deck;
    refreshIsGrey();
    initAsyncDep();
  }

  Future<void> initAsyncDep() async {
    List<RetrievedCard> tmpList = await DecksDatabase.getSyncDB().cardDao.getCardsFromDeckId(widget.deck.id);
    if (tmpList.isEmpty) {
      await ApiPerformer.getCards(deck);
      tmpList = await DecksDatabase.getSyncDB().cardDao.getCardsFromDeckId(widget.deck.id);
    }
    List<RetrievedCard> expandedList = [];
    for (var cardRef in tmpList) {
      for (int i = 0; i < cardRef.count; i++) {
        expandedList.add(cardRef);
      }
    }
    setState(() {
      cardList = expandedList;
    });
  }

  void refreshIsGrey() {
    isGrey = !(deck.localLosses != null && deck.localLosses! > 0 || deck.localWins != null && deck.localWins! > 0);
    _percentage = isGrey ? 0 : (deck.localWins ?? 0) / ((deck.localWins ?? 0) + (deck.localLosses ?? 0));
  }

  bool isGrey = true;
  double _percentage = 0;
  late Deck deck;
  List<RetrievedCard> cardList = [];

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
                leading: const BackButton(),
                title: Text(deck.name)),
          ];
        },
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: () {
                  showDeckBottomSheet(
                      context,
                      () => setState(() {
                            deck.localWins = (deck.localWins ?? 0) + 1;
                            widget.database.deckDao.updateDeck(deck);
                            refreshIsGrey();
                          }),
                      () => setState(() {
                            deck.localWins = (deck.localWins ?? 1) - 1;
                            if (deck.localWins! < 0) {
                              deck.localWins = 0;
                            }
                            widget.database.deckDao.updateDeck(deck);
                            refreshIsGrey();
                          }),
                      () => setState(() {
                            deck.localLosses = (deck.localLosses ?? 0) + 1;
                            widget.database.deckDao.updateDeck(deck);
                            refreshIsGrey();
                          }),
                      () => setState(() {
                            deck.localLosses = (deck.localLosses ?? 1) - 1;
                            if (deck.localLosses! < 0) {
                              deck.localLosses = 0;
                            }
                            widget.database.deckDao.updateDeck(deck);
                            refreshIsGrey();
                          }),
                      deck);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          flex: 1,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              (deck.localWins ?? 0).toString(),
                              style: textFontBold,
                            ),
                          )),
                      Expanded(
                        flex: 7,
                        child: LinearPercentIndicator(
                          padding: const EdgeInsets.only(bottom: 7, top: 7),
                          animation: true,
                          lineHeight: 20.0,
                          animationDuration: 1000,
                          animateFromLastPercent: true,
                          barRadius: const Radius.circular(100),
                          percent: _percentage,
                          backgroundColor: isGrey ? Colors.grey : Colors.redAccent,
                          progressColor: isGrey ? Colors.grey : Colors.green,
                        ),
                      ),
                      Expanded(
                          flex: 1,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              (deck.localLosses ?? 0).toString(),
                              style: textFontBold,
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 10,
              child: CardDisplayer(deck: deck, cardList: cardList),
            ),
          ],
        ),
      ),
    );
  }
}

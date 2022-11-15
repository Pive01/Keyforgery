import 'package:flutter/material.dart';
import 'package:keyforgery/data/storage/Database/DecksDatabase.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../data/models/DeckModel/Deck/Deck.dart';
import '../utilities/style.dart';
import '../widgets/DeckDetails/ratioController.dart';

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
  }

  void refreshIsGrey() {
    isGrey = !(deck.localLosses != null && deck.localLosses! > 0 ||
        deck.localWins != null && deck.localWins! > 0);
    _percentage = isGrey
        ? 0
        : (deck.localWins ?? 0) /
            ((deck.localWins ?? 0) + (deck.localLosses ?? 0));
  }

  bool isGrey = true;
  double _percentage = 0;
  late Deck deck;

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
          InkWell(
            onTap: () {
              showModalBottomSheet<void>(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  context: context,
                  builder: (BuildContext context) {
                    return DraggableScrollableSheet(
                        snap: true,
                        expand: false,
                        builder: (context, scrollController) {
                          return StatefulBuilder(
                            builder: (BuildContext context,
                                StateSetter setModalState) {
                              return Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Wrap(
                                      spacing: 20,
                                      // to apply margin in the main axis of the wrap
                                      runSpacing: 20,
                                      alignment: WrapAlignment.center,
                                      children: [
                                        const Icon(Icons.drag_handle),
                                        RatioController(
                                          text: 'Wins',
                                          data:
                                              (deck.localWins ?? 0).toString(),
                                          onPlusClick: () {
                                            setState(() {
                                              deck.localWins =
                                                  (deck.localWins ?? 0) + 1;
                                              widget.database.deckDao
                                                  .updateDeck(deck);
                                              refreshIsGrey();
                                            });
                                            setModalState(() {});
                                          },
                                          onMinusClick: () {
                                            setState(() {
                                              deck.localWins =
                                                  (deck.localWins ?? 1) - 1;
                                              if (deck.localWins! < 0) {
                                                deck.localWins = 0;
                                              }
                                              widget.database.deckDao
                                                  .updateDeck(deck);
                                              refreshIsGrey();
                                            });
                                            setModalState(() {});
                                          },
                                          borderColor: Colors.lightGreen,
                                        ),
                                        const Divider(),
                                        RatioController(
                                          text: 'Losses',
                                          data: (deck.localLosses ?? 0)
                                              .toString(),
                                          onPlusClick: () {
                                            setState(() {
                                              deck.localLosses =
                                                  (deck.localLosses ?? 0) + 1;
                                              widget.database.deckDao
                                                  .updateDeck(deck);
                                            });
                                            refreshIsGrey();
                                            setModalState(() {});
                                          },
                                          onMinusClick: () {
                                            setState(() {
                                              deck.localLosses =
                                                  (deck.localLosses ?? 1) - 1;
                                              if (deck.localLosses! < 0) {
                                                deck.localLosses = 0;
                                              }
                                              widget.database.deckDao
                                                  .updateDeck(deck);
                                            });
                                            refreshIsGrey();
                                            setModalState(() {});
                                          },
                                          borderColor: Colors.redAccent,
                                        ),
                                      ]));
                            },
                          );
                        });
                  });
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
        ],
      ),
    ));
  }
}

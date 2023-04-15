import 'package:flutter/material.dart';
import 'package:keyforgery/utilities/DataMantainer.dart';
import 'package:keyforgery/widgets/DeckDisplayer/HouseLogoDisplay.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../data/models/DeckModel/Deck/Deck.dart';
import '../../utilities/style.dart';
import '../../utilities/utils.dart';

class DeckDisplayer extends StatefulWidget {
  const DeckDisplayer(
      {super.key,
      required this.deck,
      required this.callBack,
      required this.callBackLong});

  final Deck deck;
  final Function callBack;
  final Function callBackLong;

  @override
  State<DeckDisplayer> createState() => _DeckDisplayerState();
}

class _DeckDisplayerState extends State<DeckDisplayer> {
  @override
  void initState() {
    super.initState();
    refreshIsIndicatorStatus();
  }

  void refreshIsIndicatorStatus() {
    isGrey =
        !(widget.deck.localLosses != null && widget.deck.localLosses! > 0 ||
            widget.deck.localWins != null && widget.deck.localWins! > 0);
    _percentage = isGrey
        ? 0
        : (widget.deck.localWins ?? 0) /
            ((widget.deck.localWins ?? 0) + (widget.deck.localLosses ?? 0));
  }

  late bool isGrey;
  late double _percentage;
  final double size = 35;

  @override
  Widget build(BuildContext context) {
    refreshIsIndicatorStatus();
    return GestureDetector(
      onTap: () {
        widget.callBack(widget.deck);
      },
      onLongPress: () {
        widget.callBackLong(widget.deck);
      },
      child: SizedBox(
        height: 124,
        child: Card(
          color: Theme.of(context).primaryColor,
          elevation: 8,
          margin: const EdgeInsets.only(top: 2, left: 5, right: 5),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(7)),
          ),
          child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    flex: 60,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                            flex: 3,
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                widget.deck.name,
                                textWidthBasis: TextWidthBasis.parent,
                                textAlign: TextAlign.start,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: textFontBold,
                              ),
                            )),
                        Expanded(
                          flex: 1,
                          child: LinearPercentIndicator(
                            padding: const EdgeInsets.only(bottom: 15),
                            animation: true,
                            animateFromLastPercent: true,
                            lineHeight: 20.0,
                            animationDuration: 1000,
                            barRadius: const Radius.circular(100),
                            percent: _percentage,
                            backgroundColor:
                                isGrey ? Colors.grey : Colors.redAccent,
                            progressColor: isGrey ? Colors.grey : Colors.green,
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                      flex: 14,
                      child: Column(
                        children: [
                          HouseLogoDisplay(
                            link: LogoConverter.getLinkFromName(
                                widget.deck.housesAndCards[0].house),
                            size: size,
                          ),
                          Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: HouseLogoDisplay(
                                  link: LogoConverter.getLinkFromName(
                                      widget.deck.housesAndCards[1].house),
                                  size: size)),
                          HouseLogoDisplay(
                              link: LogoConverter.getLinkFromName(
                                  widget.deck.housesAndCards[2].house),
                              size: size),
                        ],
                      )),
                  Expanded(
                      flex: 16,
                      child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              convertSetToAbbreviation(
                                  convertSetName(widget.deck.expansion)),
                              textAlign: TextAlign.right,
                              overflow: TextOverflow.ellipsis,
                              style: textFontLow,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  widget.deck.sasRating.toString(),
                                  textAlign: TextAlign.right,
                                  style: textFontBold,
                                ),
                                const Text(
                                  'SAS',
                                  textAlign: TextAlign.right,
                                  overflow: TextOverflow.ellipsis,
                                  style: textFontLow,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  widget.deck.rawAmber.toString(),
                                  textAlign: TextAlign.right,
                                  style: textFontBold,
                                ),
                                const Text(
                                  'Æmber',
                                  textAlign: TextAlign.right,
                                  overflow: TextOverflow.ellipsis,
                                  style: textFontLow,
                                )
                              ],
                            )
                          ])),
                ],
              )),
        ),
      ),
    );
  }
}

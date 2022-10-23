import 'package:flutter/material.dart';
import 'package:keyforgery/data/models/Deck.dart';

import '../utilities/style.dart';
import '../utilities/utils.dart';

class DeckDisplayer extends StatefulWidget {
  const DeckDisplayer({super.key, required this.deck});

  final Deck deck;

  @override
  State<DeckDisplayer> createState() => _DeckDisplayerState();
}

class _DeckDisplayerState extends State<DeckDisplayer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                      flex: 3,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                              flex: 1,
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  widget.deck.name,
                                  textWidthBasis: TextWidthBasis.parent,
                                  textAlign: TextAlign.start,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: textFontBold,
                                ),
                              )),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 1, left: 20),
                              child: Row(
                                children: const [
                                  CircleAvatar(
                                    radius: 23, // Image radius
                                    backgroundImage: NetworkImage(
                                        'https://decksofkeyforge.com/static/media/logos.484392e1.png'),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 10, right: 10),
                                    child: CircleAvatar(
                                      radius: 23, // Image radius
                                      backgroundImage: NetworkImage(
                                          'https://decksofkeyforge.com/static/media/dis.35644fd3.png'),
                                    ),
                                  ),
                                  CircleAvatar(
                                    radius: 23, // Image radius
                                    backgroundImage: NetworkImage(
                                        'https://decksofkeyforge.com/static/media/untamed.7db4a2fb.png'),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                        flex: 2,
                        child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                  alignment: Alignment.topRight,
                                  child: Text(
                                    convertSetName(widget.deck.expansion),
                                    textAlign: TextAlign.right,
                                    overflow: TextOverflow.ellipsis,
                                    style: textFontLow,
                                  )),
                              Align(
                                  alignment: Alignment.bottomRight,
                                  child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 18),
                                                child: Column(children:  [
                                                  Text(
                                                    widget.deck.sasRating.toString(),
                                                    textAlign: TextAlign.right,
                                                    style: textFontBold,
                                                  ),
                                                  const Text(
                                                    'SAS',
                                                    textAlign: TextAlign.right,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: textFontLow,
                                                  )
                                                ])),
                                            Column(children:  [
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
                                            ])
                                          ]))),
                            ]))
                  ],
                ))));
  }
}

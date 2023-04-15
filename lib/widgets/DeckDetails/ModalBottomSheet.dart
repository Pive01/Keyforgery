import 'package:flutter/material.dart';
import 'package:keyforgery/widgets/DeckDetails/ratioController.dart';

import '../../data/models/DeckModel/Deck/Deck.dart';

void showDeckBottomSheet(BuildContext context,Function onPlusWin, Function onMinusWin,Function onPlusLoss, Function onMinusLoss,Deck deck) {
  showModalBottomSheet<void>(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      context: context,
      enableDrag: true,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
            snap: true,
            expand: false,
            builder: (context, scrollController) {
              return StatefulBuilder(
                builder: (BuildContext context, StateSetter setModalState) {
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
                              data: (deck.localWins ?? 0).toString(),
                              onPlusClick: () {
                                onPlusWin();
                                setModalState(() {});
                              },
                              onMinusClick: () {
                                onMinusWin();
                                setModalState(() {});
                              },
                              borderColor: Colors.lightGreen,
                            ),
                            const Divider(),
                            RatioController(
                              text: 'Losses',
                              data: (deck.localLosses ?? 0).toString(),
                              onPlusClick: () {
                                onPlusLoss();
                                setModalState(() {});
                              },
                              onMinusClick: () {
                                onMinusLoss();
                                setModalState(() {});
                              },
                              borderColor: Colors.redAccent,
                            ),
                          ]));
                },
              );
            });
      });
}

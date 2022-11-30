import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:keyforgery/data/models/Card/Card/RetrievedCard.dart';
import 'package:keyforgery/utilities/utils.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../CardInListDisplayer.dart';

class CardList extends StatefulWidget {
  const CardList({Key? key, required this.cardList, required this.house}) : super(key: key);

  final List<RetrievedCard> cardList;
  final String house;

  @override
  State<CardList> createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  List<RetrievedCard> filteredList = [];

  @override
  Widget build(BuildContext context) {
    filteredList = widget.cardList.where((element) => element.house.makeKfFriendly() == widget.house).toList(); //TODO find out why can't do this in initState()
    return filteredList.isNotEmpty
        ? ListView.separated(
            padding: const EdgeInsets.only(top: 2),
            itemBuilder: (context, position) {
              return CardInListDisplayer(
                  card: filteredList.elementAt(position),
                  callback: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: setupAlertDialogContainer(widget.cardList, widget.house, position),
                            backgroundColor: Colors.redAccent.withOpacity(0),
                          );
                        });
                  });
            },
            itemCount: filteredList.length,
            separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
          )
        : const Center(
            child: CircularProgressIndicator(),
          );
  }
}

Widget setupAlertDialogContainer(List<RetrievedCard> cardList, String house, int position) {
  int initialPosition = cardList.indexWhere((element) => element.house == house) ~/ 12 * 12 + position;
  return SizedBox(
    height: 400.0,
    width: 500.0,
    child: ScrollablePositionedList.builder(
      itemCount: cardList.length,
      initialScrollIndex: initialPosition,
      shrinkWrap: true,
      initialAlignment: -0.03,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8),
        child: CachedNetworkImage(
          imageUrl: cardList.elementAt(index).front_image,
          fit: BoxFit.fitWidth,
          placeholder: (contest,url) =>  Image.asset('assets/images/EmptyCard.png'),
        ),
      ),
    ),
  );
}

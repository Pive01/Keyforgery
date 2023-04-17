import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:keyforgery/data/models/Card/Card/RetrievedCard.dart';
import 'package:keyforgery/utilities/utils.dart';

import '../CardInListDisplayer.dart';

class CardList extends StatefulWidget {
  const CardList({Key? key, required this.cardList, required this.house})
      : super(key: key);

  final List<RetrievedCard> cardList;
  final String house;

  @override
  State<CardList> createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  List<RetrievedCard> filteredList = [];

  @override
  Widget build(BuildContext context) {
    filteredList = widget.cardList
        .where((element) => element.house.makeKfFriendly() == widget.house)
        .toList(); //TODO find out why can't do this in initState()
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
                            content: setupAlertDialogContainer(
                                widget.cardList, widget.house, position),
                            backgroundColor: Colors.transparent,
                            surfaceTintColor: Colors.transparent,
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

Widget setupAlertDialogContainer(
    List<RetrievedCard> cardList, String house, int position) {
  int initialPosition = cardList.indexWhere((element) =>
              element.house.makeKfFriendly() == house.makeKfFriendly()) ~/
          12 *
          12 +
      position;
  return SizedBox(
    height: 400.0,
    width: 300.0,
    child: CarouselSlider(
      options: CarouselOptions(
          height: 400.0,
          initialPage: initialPosition,
          enableInfiniteScroll: false,
          enlargeCenterPage: true),
      items: cardList.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                child: CachedNetworkImage(
                  imageUrl: i.front_image,
                  alignment: Alignment.topCenter,
                  fit: BoxFit.fitWidth,
                  placeholder: (contest, url) =>
                      Image.asset('assets/images/EmptyCard.png'),
                ));
          },
        );
      }).toList(),
    ),
  );
}

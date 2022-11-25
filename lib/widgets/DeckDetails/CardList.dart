import 'package:flutter/cupertino.dart';
import 'package:keyforgery/data/models/Card/Card/RetrivedCard.dart';

class CardList extends StatefulWidget {
  const CardList({Key? key, required this.cardList}) : super(key: key);

  final List<RetrivedCard> cardList;

  @override
  State<CardList> createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  @override
  Widget build(BuildContext context) {
    return widget.cardList.isNotEmpty
        ? ListView.separated(
      padding: const EdgeInsets.only(top: 2),
      itemBuilder: (context, position) {
        return Text(widget.cardList.elementAt(position).card_title);
      },
      itemCount: widget.cardList.length,
      separatorBuilder: (context, index) => const SizedBox(
        height: 10,
      ),
    )
        : const Center(
      child: Text('Nothing to display here'),
    );
  }
}

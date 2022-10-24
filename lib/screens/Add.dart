import 'package:flutter/material.dart';
import 'package:keyforgery/data/api/Api.dart';
import 'package:keyforgery/widgets/DeckList.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

import '../data/models/Deck.dart';
import '../data/models/DokFilterWrappers/ReqBody/GetDecksReqBody.dart';

class Add extends StatefulWidget {
  const Add({Key? key}) : super(key: key);

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  List<Deck> deckList = [];
  final controller = FloatingSearchBarController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            children: [
              const Expanded(
                flex: 1,
                child: Card(
                  clipBehavior: Clip.hardEdge,
                ),
              ),
              Expanded(
                flex: 7,
                child: DeckList(
                  deckList: deckList,
                ),
              ),
            ],
          ),
          FloatingSearchBar(
            controller: controller,
            hint: 'Search...',
            scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
            transitionDuration: const Duration(milliseconds: 200),
            transitionCurve: Curves.easeInOut,
            borderRadius: BorderRadius.circular(30),
            physics: const BouncingScrollPhysics(),
            axisAlignment: 0.0,
            openAxisAlignment: 0.0,
            width: 600,
            debounceDelay: const Duration(milliseconds: 100),
            onQueryChanged: (query) {
              Api.getDecksByNamePreview(query).then(
                  (value) => setState(() {
                        deckList = value;
                      }),
                  onError: (e) {});
            },
            onSubmitted: (query) {
              Api.getDecksByName(GetDecksReqBody(title: query)).then((value) {
                setState(() => (deckList = value.decks));
              }, onError: (e) {});
              controller.close();
            },

            // Specify a custom transition to be used for
            // animating between opened and closed stated.
            transition: CircularFloatingSearchBarTransition(),
            actions: [
              FloatingSearchBarAction.searchToClear(
                showIfClosed: false,
              ),
            ],
            builder: (BuildContext context, Animation<double> transition) {
              return const Card();
            },
          ),
        ],
      ),
    );
  }
}

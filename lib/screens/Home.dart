import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keyforgery/data/api/Api.dart';
import 'package:keyforgery/data/models/Validator/UserValidator.dart';
import 'package:keyforgery/data/models/Wrappers/DokWrappers/DokFilterWrappers/ReqBody/GetDecksReqBody/GetDecksReqBody.dart';

import '../widgets/DeckList.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Keyforgery'),
      ),
      body: const DeckList(
        deckList: [],
      ),
      // body: const DeckDisplayer(),
      floatingActionButton: FloatingActionButton(
        elevation: 12,
        onPressed: () {
          // Api.getDecksByUserName(GetDecksReqBody(owner:"Pive",pageSize: 100)).then((value) => print(value.decks.length));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

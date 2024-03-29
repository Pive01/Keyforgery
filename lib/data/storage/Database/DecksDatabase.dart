import 'dart:async';
import 'package:floor/floor.dart';
import 'package:keyforgery/utilities/HouseArrayTypeConverter.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../../models/Card/Card/Card.dart';
import '../../models/Card/Card/RetrievedCard.dart';
import '../../models/DeckModel/Deck/Deck.dart';
import '../Card/CardDao.dart';
import '../Deck/DeckDao.dart';
import 'package:keyforgery/data/models/CardsDeckRef.dart';
import '../DeckWithCards/DeckWithCardsDao.dart';

part 'DecksDatabase.g.dart';

@TypeConverters([HouseArrayTypeConverter])
@Database(version: 1, entities: [Deck, Card, CardsDeckRef])
abstract class DecksDatabase extends FloorDatabase {
  static late final _database;
  static bool _isInitialized = false;

  static Future<void> initDatabase() async {
    if (!_isInitialized) {
      _database =
          await $FloorDecksDatabase.databaseBuilder('deck_database').build();
      _isInitialized = true;
    }
  }

  static DecksDatabase getSyncDB() {
    return _database;
  }

  DeckDao get deckDao;

  CardDao get cardDao;

  DeckWithCardsDao get deckWithCardsDao;
}

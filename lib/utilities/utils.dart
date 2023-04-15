import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../data/models/DeckModel/Deck/Deck.dart';
import '../data/models/Wrappers/TheCrucibleWrapper/CrucibleDeck/CrucibleDeck.dart';
import '../data/models/Wrappers/TheCrucibleWrapper/CrucibleDecksWrapper/CrucibleDecksWrapper.dart';
import '../data/models/Wrappers/TheCrucibleWrapper/TokenWrapper/RefreshToken.dart';
import '../data/storage/Database/DecksDatabase.dart';
import '../data/storage/Deck/DeckDao.dart';

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }

  String makeKfFriendly() {
    return capitalize().split(' ').join();
  }
}

String convertSetName(String setName) {
  return setName.split(RegExp(r'_')).map((str) => str.capitalize()).join(' ');
}

String convertSetToAbbreviation(String setName) {
  return setName.split(' ').map((e) => e.capitalize()[0]).join("");
}

Future<void> updateDifferences(List<CrucibleDeck> prev, List<CrucibleDeck> next) async {
  DeckDao deckDao = DecksDatabase.getSyncDB().deckDao;
  List<Deck> actualDecks = await deckDao.getDecksAsList();
  int wins = 0;
  int losses = 0;
  CrucibleDeck prevDeck;
  Deck deck;
  for (var crucibleDeck in next) {
    if (actualDecks.any((element) => element.keyforgeId == crucibleDeck.uuid)) {
      deck = actualDecks.firstWhere((element) => element.keyforgeId == crucibleDeck.uuid);
      wins = deck.localWins ?? 0;
      losses = deck.localLosses ?? 0;
      bool exists = prev.any((element) => element.uuid == crucibleDeck.uuid);
      if (exists) {
        prevDeck = prev.firstWhere((element) => element.uuid == crucibleDeck.uuid);
        deck.localWins = wins + int.parse(crucibleDeck.wins) - int.parse(prevDeck.wins);
        deck.localLosses = losses + int.parse(crucibleDeck.losses) + int.parse(prevDeck.losses);
      } else {
        deck.localWins = int.parse(crucibleDeck.wins) + wins;
        deck.localLosses = int.parse(crucibleDeck.losses) + losses;
      }
      deckDao.updateDeck(deck);
    }
  }
}

class SharedPrefs {
  static const String _theCrucibleRefresh = "theCrucibleRefresh";
  static const String _theCruciblePrevious = "theCruciblePrevious";
  static const String _defaultRefreshToken = '{"id":0,"username":"","token":""}';
  static List<String> houses = [];
  static Future<void> setRefreshToken(RefreshToken token) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(_theCrucibleRefresh, json.encode(token));
  }

  static Future<RefreshToken> getRefreshToken() async {
    final prefs = await SharedPreferences.getInstance();
    return RefreshToken.fromJson(json.decode(prefs.getString(_theCrucibleRefresh) ?? _defaultRefreshToken));
  }

  static Future<void> setCruciblePrevious(CrucibleDecksWrapper prev) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(_theCruciblePrevious, json.encode(prev));
  }

  static Future<CrucibleDecksWrapper> getCruciblePrevious() async {
    final prefs = await SharedPreferences.getInstance();
    return CrucibleDecksWrapper.fromJson(json.decode(prefs.getString(_theCruciblePrevious)!));
  }

}

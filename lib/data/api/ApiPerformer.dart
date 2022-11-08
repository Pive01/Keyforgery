import 'package:keyforgery/data/storage/Deck/DeckDao.dart';

import '../models/DeckModel/Deck/Deck.dart';
import '../models/Validator/CrucibleLogin.dart';
import '../models/Wrappers/TheCrucibleWrapper/CrucibleDeck/CrucibleDeck.dart';
import '../models/Wrappers/TheCrucibleWrapper/CrucibleDecksWrapper/CrucibleDecksWrapper.dart';
import '../models/Wrappers/TheCrucibleWrapper/TokenWrapper/TokenWrapper.dart';
import '../storage/Database/DecksDatabase.dart';
import 'Api.dart';

class ApiPerformer {
  static Future<void> overrideCrucibleImports(String username, String password) async {
    TokenWrapper token = await Api.getCrucibleToken(CrucibleLogin(username, password));
    CrucibleDecksWrapper cDecks = await Api.getCrucibleDecks("Bearer ${token.token}");
    DeckDao deckDao = DecksDatabase.getSyncDB().deckDao;
    for (var element in cDecks.decks) {
      _insertDeckFromCrucibleToDb(deckDao, element);
    }
  }

  static Future<void> addCrucibleImports(String username, String password) async {
    TokenWrapper token = await Api.getCrucibleToken(CrucibleLogin(username, password));
    CrucibleDecksWrapper cDecks = await Api.getCrucibleDecks("Bearer ${token.token}");
    _compareDecks(cDecks.decks);
  }

  static Future<void> _compareDecks(List<CrucibleDeck> crucibleList) async { //TODO keep a list of all decks and store them in one go
    DeckDao deckDao = DecksDatabase.getSyncDB().deckDao;
    List<Deck> actualDecks = await deckDao.getDecksAsList();
    for (var crucibleDeck in crucibleList) {
      bool exists = actualDecks.any((element) => element.keyforgeId == crucibleDeck.uuid);
      if (!exists) {
        _insertDeckFromCrucibleToDb(deckDao, crucibleDeck);
        continue;
      }
      Deck currentDeck = actualDecks.firstWhere((element) => element.keyforgeId == crucibleDeck.uuid);
      int wins = currentDeck.localWins ?? 0;
      int loss = currentDeck.localLosses ?? 0;
      currentDeck.localWins = int.parse(crucibleDeck.wins) + wins;
      currentDeck.localLosses = int.parse(crucibleDeck.losses) + loss;
      deckDao.updateDeck(currentDeck);
    }
  }

  static Future<void> _insertDeckFromCrucibleToDb(DeckDao deckDao, CrucibleDeck cd) async {
    Deck deck = (await Api.getDeckById(cd.uuid)).deck;
    deck.localWins = int.parse(cd.wins);
    deck.localLosses = int.parse(cd.losses);
    deckDao.addDeck(deck);
  }
}

import 'package:keyforgery/data/models/CardsDeckRef.dart';
import 'package:keyforgery/data/models/UserInfo.dart';
import 'package:keyforgery/data/models/Validator/UserValidator.dart';
import 'package:keyforgery/data/models/Wrappers/DokWrappers/DokFilterWrappers/ReqBody/GetDecksReqBody/GetDecksReqBody.dart';
import 'package:keyforgery/data/models/Wrappers/MasterVaultWrappers/linkCards/MVCardsWrapper/MVCardsWrapper.dart';
import 'package:keyforgery/data/storage/Deck/DeckDao.dart';
import 'package:retrofit/retrofit.dart';

import '../../utilities/utils.dart';
import '../models/Card/Card/Card.dart';
import '../models/DeckModel/Deck/Deck.dart';
import '../models/FilterCount.dart';
import '../models/Validator/CrucibleLogin.dart';
import '../models/Wrappers/TheCrucibleWrapper/CrucibleDeck/CrucibleDeck.dart';
import '../models/Wrappers/TheCrucibleWrapper/CrucibleDecksWrapper/CrucibleDecksWrapper.dart';
import '../models/Wrappers/TheCrucibleWrapper/TokenWrapper/TokenWrapper.dart';
import '../storage/Database/DecksDatabase.dart';
import 'Api.dart';

class ApiPerformer {
  static Future<void> overrideCrucibleImports(
      String username, String password, bool keepLoggedIn) async {
    TokenWrapper token =
        await Api.getCrucibleToken(CrucibleLogin(username, password));
    if (keepLoggedIn) {
      await SharedPrefs.setRefreshToken(token.refreshToken);
    }
    CrucibleDecksWrapper cDecks =
        await Api.getCrucibleDecks("Bearer ${token.token}");
    DeckDao deckDao = DecksDatabase.getSyncDB().deckDao;
    for (var element in cDecks.decks) {
      _insertDeckFromCrucibleToDb(deckDao, element);
    }
  }

  static Future<void> addCrucibleImports(
      String username, String password, bool keepLoggedIn) async {
    TokenWrapper token =
        await Api.getCrucibleToken(CrucibleLogin(username, password));
    if (keepLoggedIn) {
      await SharedPrefs.setRefreshToken(token.refreshToken);
    }
    CrucibleDecksWrapper cDecks =
        await Api.getCrucibleDecks("Bearer ${token.token}");
    _compareDecks(cDecks.decks);
  }

  static Future<void> _compareDecks(List<CrucibleDeck> crucibleList) async {
    //TODO keep a list of all decks and store them in one go
    DeckDao deckDao = DecksDatabase.getSyncDB().deckDao;
    List<Deck> actualDecks = await deckDao.getDecksAsList();
    for (var crucibleDeck in crucibleList) {
      bool exists =
          actualDecks.any((element) => element.keyforgeId == crucibleDeck.uuid);
      if (!exists) {
        _insertDeckFromCrucibleToDb(deckDao, crucibleDeck);
        continue;
      }
      Deck currentDeck = actualDecks
          .firstWhere((element) => element.keyforgeId == crucibleDeck.uuid);
      int wins = currentDeck.localWins ?? 0;
      int loss = currentDeck.localLosses ?? 0;
      currentDeck.localWins = int.parse(crucibleDeck.wins) + wins;
      currentDeck.localLosses = int.parse(crucibleDeck.losses) + loss;
      deckDao.updateDeck(currentDeck);
    }
  }

  static Future<void> _insertDeckFromCrucibleToDb(
      DeckDao deckDao, CrucibleDeck cd) async {
    Deck deck = (await Api.getDeckById(cd.uuid)).deck;
    deck.localWins = int.parse(cd.wins);
    deck.localLosses = int.parse(cd.losses);
    deckDao.addDeck(deck);
  }

  static Future<void> importDokDecks(String email, String password) async {
    HttpResponse<void> auth =
        await Api.getAuthorization(UserValidator(email, password));
    String token = auth.response.headers.value("authorization") ?? "";
    UserInfo info = await Api.getUsername(token);
    FilterCount numbers =
        await Api.countDecks(GetDecksReqBody(owner: info.username));
    List<int> requestPrimitive =
        List<int>.generate(numbers.pages, (i) => i + 1);
    var responses = await Future.wait(requestPrimitive.map((e) =>
        Api.getDecksByUserName(
            GetDecksReqBody(owner: info.username, page: e))));
    DeckDao deckDao = DecksDatabase.getSyncDB().deckDao;
    deckDao.bulkAdd((responses
        .map((e) => e.decks)
        .toList()
        .reduce((value, element) => value + element)));
  }

  static Future<void> getCards(Deck deck) async {
    MVCardsWrapper wrapper = await Api.getCards(deck.keyforgeId);
    List<Card> shortedCardList = wrapper.linked.cards;
    List<String> fullCardList = wrapper.data.links.cards;
    shortedCardList.removeWhere((element) =>
        element.id ==
        "37377d67-2916-4d45-b193-bea6ecd853e3"); //remove tide card
    DecksDatabase db = DecksDatabase.getSyncDB();
    await db.cardDao.bulkAdd(shortedCardList);
    await db.deckWithCardsDao.bulkAdd(shortedCardList
        .map((e) => CardsDeckRef(
            e.id,
            deck.id,
            fullCardList
                .map((cardId) => cardId == e.id ? 1 : 0)
                .reduce((value, element) => value + element),
            e.is_maverick,
            wrapper.data.set_era_cards.Legacy.any((element) => element == e.id),
            e.is_anomaly,
            e.is_enhanced))
        .toList());
  }
}

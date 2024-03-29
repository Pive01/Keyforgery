import 'dart:async';

import 'package:floor/floor.dart';

import '../../models/DeckModel/Deck/Deck.dart';

@dao
abstract class DeckDao {
  @Insert(onConflict: OnConflictStrategy.ignore)
  Future<void> addDeck(Deck deck);

  @Query("select * from decks ORDER BY sasRating DESC,rawAmber DESC")
  Stream<List<Deck>> getDecksAsStream();

  @Query("select * from decks ORDER BY sasRating DESC,rawAmber DESC")
  Future<List<Deck>> getDecksAsList();

  @update
  Future<void> updateDeck(Deck deck);

  @Insert(onConflict: OnConflictStrategy.ignore)
  Future<void> bulkAdd(List<Deck> deckCollection);

  @delete
  Future<void> deleteDeck(Deck deck);

  @Query(
      "UPDATE decks SET sasRating=:sasRating,powerLevel=:powerLevel,chains=:chains,wins=:wins,losses=:losses,aercScore=:aercScore,synergyRating=:synergyRating,keyCheatCount=:keyCheatCount ,cardDrawCount=:cardDrawCount,cardArchiveCount=:cardArchiveCount,expectedAmber=:expectedAmber,creatureProtection=:creatureProtection,efficiency=:efficiency,efficiencyBonus=:efficiencyBonus,amberControl=:amberControl,creatureControl=:creatureControl,artifactControl=:artifactControl,recursion=:recursion,metaScores=:metaScores,antisynergyRating=:antisynergyRating WHERE id=:id")
  Future<void> updateDeckStatus(
      int sasRating,
      int powerLevel,
      int chains,
      int wins,
      int losses,
      double aercScore,
      double synergyRating,
      double antisynergyRating,
      int cardDrawCount,
      int cardArchiveCount,
      double recursion,
      int keyCheatCount,
      int id,
      double efficiency,
      double expectedAmber,
      double creatureProtection,
      int metaScores,
      double amberControl,
      double creatureControl,
      double artifactControl,
      double efficiencyBonus);
}

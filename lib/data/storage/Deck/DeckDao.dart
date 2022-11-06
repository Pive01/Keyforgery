import 'dart:async';

import 'package:floor/floor.dart';

import '../../models/DeckDTO.dart';
import '../../models/DeckModel/Deck/Deck.dart';

@dao
abstract class DeckDao {

  @Insert(onConflict: OnConflictStrategy.ignore)
  Future<void> addDeck(Deck deck);

  @Query("select * from decks ORDER BY sasRating DESC,rawAmber DESC")
  Stream<List<Deck>> getDecks();

  @Query("UPDATE decks SET localWins=:wins WHERE id=:id")
  Future<void> updateWins(int wins, int id);

  @Query("UPDATE decks SET localLosses=:loss WHERE id=:id")
  Future<void> updateLosses(int loss, int id);

  @Insert(onConflict: OnConflictStrategy.ignore)
  Future<void> bulkAdd(List<Deck> deckCollection);

  @delete
  Future<void> deleteDeck(Deck deck);

  @Query("UPDATE decks SET sasRating=:sasRating,powerLevel=:powerLevel,chains=:chains,wins=:wins,losses=:losses,aercScore=:aercScore,synergyRating=:synergyRating,keyCheatCount=:keyCheatCount ,cardDrawCount=:cardDrawCount,cardArchiveCount=:cardArchiveCount,expectedAmber=:expectedAmber,creatureProtection=:creatureProtection,efficiency=:efficiency,efficiencyBonus=:efficiencyBonus,amberControl=:amberControl,creatureControl=:creatureControl,artifactControl=:artifactControl,recursion=:recursion,metaScores=:metaScores,antisynergyRating=:antisynergyRating WHERE id=:id")
  Future<void> updateDeckStatus(int sasRating, int powerLevel, int chains, int wins, int losses,
      double aercScore, double synergyRating, double antisynergyRating,
      int cardDrawCount, int cardArchiveCount,double recursion,
      int keyCheatCount, int id, double efficiency, double expectedAmber,
      double creatureProtection,int metaScores,double amberControl,
      double creatureControl,double artifactControl,double efficiencyBonus);


  @Query("SELECT * FROM decks WHERE id=:id")
  Future<DeckDTO?> getDeckDTOs(int id);

  @Query("SELECT * FROM decks")
  Future<List<DeckDTO>?> getAllDeckDTOs();
}
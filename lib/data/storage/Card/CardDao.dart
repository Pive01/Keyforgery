import 'dart:async';

import 'package:floor/floor.dart';
import 'package:keyforgery/data/models/Card/Card/RetrievedCard.dart';

import '../../models/Card/Card/Card.dart';

@dao
abstract class CardDao {

  @Insert(onConflict: OnConflictStrategy.ignore)
  Future<void> bulkAdd(List<Card> cardsDeckRefCollection);

  @Query("Select c.id, c.card_title,c.house,c.card_type, c.front_image,c.card_text,c.amber,c.rarity,cdj.count,cdj.is_anomaly,cdj.is_enhanced,cdj.is_legacy,"
      "cdj.is_maverick from cards as c INNER JOIN cards_deck_join as cdj on c.id=cdj.cardId where c.id IN (Select cardId from cards_deck_join where deckId "
      "=:deckId) Group by c.id Order by c.house, c.card_title")
  Future<List<RetrievedCard>> getCardsFromDeckId(int deckId);
}
import 'package:floor/floor.dart';

import 'Card/Card/Card.dart';
import 'DeckModel/Deck/Deck.dart';

@Entity(tableName: "cards_deck_join", primaryKeys: [
  "cardId",
  "deckId"
], foreignKeys: [
  ForeignKey(entity: Card, parentColumns: ['id'], childColumns: ['cardId']),
  ForeignKey(
      entity: Deck,
      parentColumns: ["id"],
      childColumns: ["deckId"],
      onDelete: ForeignKeyAction.cascade),
])
class CardsDeckRef {
  String cardId;
  int deckId;
  int count;
  bool is_maverick;

  @override
  String toString() {
    return 'CardsDeckRef{cardId: $cardId, deckId: $deckId, count: $count, is_maverick: $is_maverick, is_legacy: $is_legacy, is_anomaly: $is_anomaly, is_enhanced: $is_enhanced}';
  }

  bool is_legacy;
  bool is_anomaly;
  bool is_enhanced;

  CardsDeckRef(this.cardId, this.deckId, this.count, this.is_maverick,
      this.is_legacy, this.is_anomaly, this.is_enhanced);
}

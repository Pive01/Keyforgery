import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:keyforgery/data/models/Card/Card/Card.dart';

part 'RetrievedCard.g.dart';

@entity
@JsonSerializable()
class RetrievedCard extends Card {
  bool is_legacy;
  int count;

  RetrievedCard(
      super.id,
      super.card_title,
      super.house,
      super.card_type,
      super.front_image,
      super.card_text,
      super.amber,
      super.rarity,
      super.is_maverick,
      super.is_anomaly,
      super.is_enhanced,
      this.count,
      this.is_legacy);

  @override
  String toString() {
    return '${super.card_title}: $count';
  }

  factory RetrievedCard.fromJson(Map<String, dynamic> json) =>
      _$RetrievedCardFromJson(json);
  Map<String, dynamic> toJson() => _$RetrievedCardToJson(this);
}

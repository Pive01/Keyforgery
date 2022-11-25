import 'package:json_annotation/json_annotation.dart';
import 'package:keyforgery/data/models/Card/Card/Card.dart';


part 'RetrivedCard.g.dart';

@JsonSerializable()
class RetrivedCard extends Card {

  bool is_legacy;
  int count;

  RetrivedCard(super.id, super.card_title, super.house, super.card_type, super.front_image, super.card_text, super.amber, super.rarity, super.is_maverick,
      super.is_anomaly, super.is_enhanced, this.count, this.is_legacy);

  @override
  String toString() {
    return super.toString() + 'is_legacy: $is_legacy, count: $count}';
  }



  factory RetrivedCard.fromJson(Map<String, dynamic> json) => _$RetrivedCardFromJson(json);
  Map<String, dynamic> toJson() => _$RetrivedCardToJson(this);
}

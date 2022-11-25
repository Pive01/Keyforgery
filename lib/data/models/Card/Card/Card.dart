import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Card.g.dart';

@Entity(tableName: "cards")
@JsonSerializable()
class Card{
  @PrimaryKey()
  String id;
  String card_title;
  String house;
  String card_type;
  String front_image;
  String card_text;
  int amber;
  String rarity;
  bool is_maverick;
  bool is_anomaly;
  bool is_enhanced;

  Card(
      this.id,
      this.card_title,
      this.house,
      this.card_type,
      this.front_image,
      this.card_text,
      this.amber,
      this.rarity,
      this.is_maverick,
      this.is_anomaly,
      this.is_enhanced);

  @override
  String toString() {
    return 'Card{id: $id, card_title: $card_title, house: $house, card_type: $card_type, front_image: $front_image, card_text: $card_text, amber: $amber, '
        'rarity: $rarity, is_maverick: $is_maverick, is_anomaly: $is_anomaly, is_enhanced: $is_enhanced ';
  }

  factory Card.fromJson(Map<String, dynamic> json) => _$CardFromJson(json);
  Map<String, dynamic> toJson() => _$CardToJson(this);
}
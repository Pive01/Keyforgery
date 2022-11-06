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
  String traits;
  int amber;
  String power;
  String armor;
  String rarity;
  String flavor_text;
  String card_number;
  int expansion;
  bool is_maverick;
  bool is_anomaly;
  bool is_enhanced;
  bool is_non_deck;

  Card(
      this.id,
      this.card_title,
      this.house,
      this.card_type,
      this.front_image,
      this.card_text,
      this.traits,
      this.amber,
      this.power,
      this.armor,
      this.rarity,
      this.flavor_text,
      this.card_number,
      this.expansion,
      this.is_maverick,
      this.is_anomaly,
      this.is_enhanced,
      this.is_non_deck);

  factory Card.fromJson(Map<String, dynamic> json) => _$CardFromJson(json);
  Map<String, dynamic> toJson() => _$CardToJson(this);
}
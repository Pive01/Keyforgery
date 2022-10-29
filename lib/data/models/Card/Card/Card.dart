import 'package:json_annotation/json_annotation.dart';

part 'Card.g.dart';

@JsonSerializable()
class Card{
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

  @override
  String toString() {
    return 'Card{id: $id, card_title: $card_title, house: $house, card_type: $card_type, front_image: $front_image, card_text: $card_text, traits: $traits, amber: $amber, power: $power, armor: $armor, rarity: $rarity, flavor_text: $flavor_text, card_number: $card_number, expansion: $expansion, is_maverick: $is_maverick, is_anomaly: $is_anomaly, is_enhanced: $is_enhanced, is_non_deck: $is_non_deck}';
  }

  factory Card.fromJson(Map<String, dynamic> json) => _$CardFromJson(json);
  Map<String, dynamic> toJson() => _$CardToJson(this);
}
import 'package:json_annotation/json_annotation.dart';

part 'HousesAndCards.g.dart';
@JsonSerializable()
class HousesAndCards {
  String house;
  HousesAndCards(this.house);

  factory HousesAndCards.fromJson(Map<String, dynamic> json) => _$HousesAndCardsFromJson(json);
  Map<String, dynamic> toJson() => _$HousesAndCardsToJson(this);
}
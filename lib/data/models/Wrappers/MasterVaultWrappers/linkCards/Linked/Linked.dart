import 'package:json_annotation/json_annotation.dart';

import '../../../../Card/Card/Card.dart';
import '../../../../House/House.dart';

part 'Linked.g.dart';

@JsonSerializable()
class Linked {
  List<House> houses;
  List<Card> cards;

  Linked(this.houses,this.cards);

  factory Linked.fromJson(Map<String, dynamic> json) => _$LinkedFromJson(json);
  Map<String, dynamic> toJson() => _$LinkedToJson(this);
}
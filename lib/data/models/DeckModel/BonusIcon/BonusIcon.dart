import 'dart:core';
import 'package:json_annotation/json_annotation.dart';


part 'BonusIcon.g.dart';

@JsonSerializable()
class BonusIcon {

  String card_id;
  List<String> bonus_icons;

  BonusIcon(
      this.card_id,
      this.bonus_icons);


  factory BonusIcon.fromJson(Map<String, dynamic> json) => _$BonusIconFromJson(json);

  Map<String, dynamic> toJson() => _$BonusIconToJson(this);
}

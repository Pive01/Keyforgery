
import 'package:json_annotation/json_annotation.dart';

part 'Links.g.dart';

@JsonSerializable()
class Links{
  List<String> houses;
  List<String> cards;

  Links(this.houses, this.cards);

  @override
  String toString() {
    return 'Links{houses: $houses, cards: $cards}';
  }

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);
  Map<String, dynamic> toJson() => _$LinksToJson(this);
}
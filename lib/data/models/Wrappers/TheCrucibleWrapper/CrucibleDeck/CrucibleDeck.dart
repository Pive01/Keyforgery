import 'package:json_annotation/json_annotation.dart';

part 'CrucibleDeck.g.dart';

@JsonSerializable()
class CrucibleDeck {
  String uuid;
  String wins;
  String losses;

  @override
  String toString() {
    return 'CrucibleDeck{uuid: $uuid, wins: $wins, losses: $losses}';
  }

  CrucibleDeck(this.uuid, this.wins, this.losses);

  factory CrucibleDeck.fromJson(Map<String, dynamic> json) =>
      _$CrucibleDeckFromJson(json);
  Map<String, dynamic> toJson() => _$CrucibleDeckToJson(this);
}

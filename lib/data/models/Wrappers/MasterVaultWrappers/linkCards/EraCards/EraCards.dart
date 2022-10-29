import 'package:json_annotation/json_annotation.dart';

part 'EraCards.g.dart';

@JsonSerializable()
class EraCards{
  List<String> Legacy;
  List<String> Anomaly;

  EraCards(this.Legacy, this.Anomaly);

  @override
  String toString() {
    return 'EraCards{Legacy: $Legacy, Anomaly: $Anomaly}';
  }

  factory EraCards.fromJson(Map<String, dynamic> json) => _$EraCardsFromJson(json);
  Map<String, dynamic> toJson() => _$EraCardsToJson(this);
}
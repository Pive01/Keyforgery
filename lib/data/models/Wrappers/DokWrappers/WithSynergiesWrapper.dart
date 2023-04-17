import 'package:json_annotation/json_annotation.dart';

import '../../DeckModel/Deck/Deck.dart';

part 'WithSynergiesWrapper.g.dart';

@JsonSerializable()
class WithSynergiesWrapper {
  Deck deck;
  double synergyPercentile;
  double antisynergyPercentile;

  WithSynergiesWrapper(
      this.deck, this.synergyPercentile, this.antisynergyPercentile);

  factory WithSynergiesWrapper.fromJson(Map<String, dynamic> json) =>
      _$WithSynergiesWrapperFromJson(json);
  Map<String, dynamic> toJson() => _$WithSynergiesWrapperToJson(this);
}

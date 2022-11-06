import 'dart:core';
import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';

import '../HouseAndCards/HousesAndCards.dart';

part 'Deck.g.dart';

@Entity(tableName: "decks")
@JsonSerializable()
class Deck {
  @PrimaryKey()
  int id;
  String keyforgeId;
  String name;
  String expansion;
  int creatureCount;
  int actionCount;
  int? artifactCount;
  double expectedAmber;
  double amberControl;
  double? creatureControl;
  double? artifactControl;
  double? efficiency;
  int? effectivePower;
  double? creatureProtection;
  double? disruption;
  double? aercScore;
  int aercVersion;
  int sasRating;
  double synergyRating;
  double antisynergyRating;

  int? localWins;
  int? localLosses;
  double efficiencyBonus;
  int totalPower;
  int rawAmber;
  double sasPercentile;
  List<HousesAndCards> housesAndCards;


  Deck(
      this.id,
      this.keyforgeId,
      this.name,
      this.expansion,
      this.creatureCount,
      this.actionCount,
      this.artifactCount,
      this.expectedAmber,
      this.amberControl,
      this.creatureControl,
      this.artifactControl,
      this.efficiency,
      this.effectivePower,
      this.creatureProtection,
      this.disruption,
      this.aercScore,
      this.aercVersion,
      this.sasRating,
      this.synergyRating,
      this.antisynergyRating,
      this.localWins,
      this.localLosses,
      this.efficiencyBonus,
      this.totalPower,
      this.rawAmber,
      this.sasPercentile,
      this.housesAndCards);

  factory Deck.fromJson(Map<String, dynamic> json) => _$DeckFromJson(json);

  Map<String, dynamic> toJson() => _$DeckToJson(this);
}

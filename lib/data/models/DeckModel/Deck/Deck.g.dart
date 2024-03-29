// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Deck.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Deck _$DeckFromJson(Map<String, dynamic> json) => Deck(
      json['id'] as int,
      json['keyforgeId'] as String,
      json['name'] as String,
      json['expansion'] as String,
      json['creatureCount'] as int,
      json['actionCount'] as int,
      json['artifactCount'] as int?,
      (json['expectedAmber'] as num).toDouble(),
      (json['amberControl'] as num).toDouble(),
      (json['creatureControl'] as num?)?.toDouble(),
      (json['artifactControl'] as num?)?.toDouble(),
      (json['efficiency'] as num?)?.toDouble(),
      json['effectivePower'] as int?,
      (json['creatureProtection'] as num?)?.toDouble(),
      (json['disruption'] as num?)?.toDouble(),
      (json['aercScore'] as num?)?.toDouble(),
      json['sasRating'] as int,
      (json['synergyRating'] as num).toDouble(),
      (json['antisynergyRating'] as num).toDouble(),
      json['localWins'] as int?,
      json['localLosses'] as int?,
      (json['efficiencyBonus'] as num).toDouble(),
      json['totalPower'] as int,
      json['rawAmber'] as int,
      (json['housesAndCards'] as List<dynamic>)
          .map((e) => HousesAndCards.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DeckToJson(Deck instance) => <String, dynamic>{
      'id': instance.id,
      'keyforgeId': instance.keyforgeId,
      'name': instance.name,
      'expansion': instance.expansion,
      'creatureCount': instance.creatureCount,
      'actionCount': instance.actionCount,
      'artifactCount': instance.artifactCount,
      'expectedAmber': instance.expectedAmber,
      'amberControl': instance.amberControl,
      'creatureControl': instance.creatureControl,
      'artifactControl': instance.artifactControl,
      'efficiency': instance.efficiency,
      'effectivePower': instance.effectivePower,
      'creatureProtection': instance.creatureProtection,
      'disruption': instance.disruption,
      'aercScore': instance.aercScore,
      'sasRating': instance.sasRating,
      'synergyRating': instance.synergyRating,
      'antisynergyRating': instance.antisynergyRating,
      'localWins': instance.localWins,
      'localLosses': instance.localLosses,
      'efficiencyBonus': instance.efficiencyBonus,
      'totalPower': instance.totalPower,
      'rawAmber': instance.rawAmber,
      'housesAndCards': instance.housesAndCards,
    };

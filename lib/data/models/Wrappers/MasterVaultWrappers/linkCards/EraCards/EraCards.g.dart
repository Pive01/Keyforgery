// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'EraCards.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EraCards _$EraCardsFromJson(Map<String, dynamic> json) => EraCards(
      (json['Legacy'] as List<dynamic>).map((e) => e as String).toList(),
      (json['Anomaly'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$EraCardsToJson(EraCards instance) => <String, dynamic>{
      'Legacy': instance.Legacy,
      'Anomaly': instance.Anomaly,
    };

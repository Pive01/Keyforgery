// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Linked.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Linked _$LinkedFromJson(Map<String, dynamic> json) => Linked(
      (json['houses'] as List<dynamic>)
          .map((e) => House.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['cards'] as List<dynamic>)
          .map((e) => Card.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LinkedToJson(Linked instance) => <String, dynamic>{
      'houses': instance.houses,
      'cards': instance.cards,
    };

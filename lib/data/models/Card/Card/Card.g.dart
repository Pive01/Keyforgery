// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Card _$CardFromJson(Map<String, dynamic> json) => Card(
      json['id'] as String,
      json['card_title'] as String,
      json['house'] as String,
      json['card_type'] as String,
      json['front_image'] as String,
      json['card_text'] as String,
      json['amber'] as int,
      json['rarity'] as String,
      json['is_maverick'] as bool,
      json['is_anomaly'] as bool,
      json['is_enhanced'] as bool,
    );

Map<String, dynamic> _$CardToJson(Card instance) => <String, dynamic>{
      'id': instance.id,
      'card_title': instance.card_title,
      'house': instance.house,
      'card_type': instance.card_type,
      'front_image': instance.front_image,
      'card_text': instance.card_text,
      'amber': instance.amber,
      'rarity': instance.rarity,
      'is_maverick': instance.is_maverick,
      'is_anomaly': instance.is_anomaly,
      'is_enhanced': instance.is_enhanced,
    };

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
      json['traits'] as String,
      json['amber'] as int,
      json['power'] as String,
      json['armor'] as String,
      json['rarity'] as String,
      json['flavor_text'] as String,
      json['card_number'] as String,
      json['expansion'] as int,
      json['is_maverick'] as bool,
      json['is_anomaly'] as bool,
      json['is_enhanced'] as bool,
      json['is_non_deck'] as bool,
    );

Map<String, dynamic> _$CardToJson(Card instance) => <String, dynamic>{
      'id': instance.id,
      'card_title': instance.card_title,
      'house': instance.house,
      'card_type': instance.card_type,
      'front_image': instance.front_image,
      'card_text': instance.card_text,
      'traits': instance.traits,
      'amber': instance.amber,
      'power': instance.power,
      'armor': instance.armor,
      'rarity': instance.rarity,
      'flavor_text': instance.flavor_text,
      'card_number': instance.card_number,
      'expansion': instance.expansion,
      'is_maverick': instance.is_maverick,
      'is_anomaly': instance.is_anomaly,
      'is_enhanced': instance.is_enhanced,
      'is_non_deck': instance.is_non_deck,
    };

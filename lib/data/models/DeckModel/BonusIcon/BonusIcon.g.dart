// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BonusIcon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BonusIcon _$BonusIconFromJson(Map<String, dynamic> json) => BonusIcon(
      json['card_id'] as String,
      (json['bonus_icons'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$BonusIconToJson(BonusIcon instance) => <String, dynamic>{
      'card_id': instance.card_id,
      'bonus_icons': instance.bonus_icons,
    };

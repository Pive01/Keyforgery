// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Links.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Links _$LinksFromJson(Map<String, dynamic> json) => Links(
      (json['houses'] as List<dynamic>).map((e) => e as String).toList(),
      (json['cards'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$LinksToJson(Links instance) => <String, dynamic>{
      'houses': instance.houses,
      'cards': instance.cards,
    };

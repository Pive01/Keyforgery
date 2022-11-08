// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CrucibleDecksWrapper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CrucibleDecksWrapper _$CrucibleDecksWrapperFromJson(
        Map<String, dynamic> json) =>
    CrucibleDecksWrapper(
      (json['decks'] as List<dynamic>)
          .map((e) => CrucibleDeck.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['success'] as bool,
    );

Map<String, dynamic> _$CrucibleDecksWrapperToJson(
        CrucibleDecksWrapper instance) =>
    <String, dynamic>{
      'success': instance.success,
      'decks': instance.decks,
    };

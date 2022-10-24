// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'FilterWrapper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilterWrapper _$FilterWrapperFromJson(Map<String, dynamic> json) =>
    FilterWrapper(
      json['page'] as int,
      (json['decks'] as List<dynamic>)
          .map((e) => Deck.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FilterWrapperToJson(FilterWrapper instance) =>
    <String, dynamic>{
      'page': instance.page,
      'decks': instance.decks,
    };

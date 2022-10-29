// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MVCardsWrapper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MVCardsWrapper _$MVCardsWrapperFromJson(Map<String, dynamic> json) =>
    MVCardsWrapper(
      MVDeck.fromJson(json['data'] as Map<String, dynamic>),
      Linked.fromJson(json['_linked'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MVCardsWrapperToJson(MVCardsWrapper instance) =>
    <String, dynamic>{
      'data': instance.data,
      '_linked': instance.linked,
    };

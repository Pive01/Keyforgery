// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'WithSynergiesWrapper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WithSynergiesWrapper _$WithSynergiesWrapperFromJson(
        Map<String, dynamic> json) =>
    WithSynergiesWrapper(
      Deck.fromJson(json['deck'] as Map<String, dynamic>),
      (json['synergyPercentile'] as num).toDouble(),
      (json['antisynergyPercentile'] as num).toDouble(),
    );

Map<String, dynamic> _$WithSynergiesWrapperToJson(
        WithSynergiesWrapper instance) =>
    <String, dynamic>{
      'deck': instance.deck,
      'synergyPercentile': instance.synergyPercentile,
      'antisynergyPercentile': instance.antisynergyPercentile,
    };

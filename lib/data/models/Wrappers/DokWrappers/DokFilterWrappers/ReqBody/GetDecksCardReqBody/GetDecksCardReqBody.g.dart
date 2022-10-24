// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GetDecksCardReqBody.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDecksCardReqBody _$GetDecksCardReqBodyFromJson(Map<String, dynamic> json) =>
    GetDecksCardReqBody(
      (json['cardNames'] as List<dynamic>).map((e) => e as String).toList(),
      json['quantity'] as int,
    );

Map<String, dynamic> _$GetDecksCardReqBodyToJson(
        GetDecksCardReqBody instance) =>
    <String, dynamic>{
      'cardNames': instance.cardNames,
      'quantity': instance.quantity,
    };

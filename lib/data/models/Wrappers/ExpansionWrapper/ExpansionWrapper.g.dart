// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ExpansionWrapper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExpansionWrapper _$ExpansionWrapperFromJson(Map<String, dynamic> json) =>
    ExpansionWrapper(
      (json['data'] as List<dynamic>)
          .map((e) => Expansion.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ExpansionWrapperToJson(ExpansionWrapper instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

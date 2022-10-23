// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HouseWrapper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HouseWrapper _$HouseWrapperFromJson(Map<String, dynamic> json) => HouseWrapper(
      (json['data'] as List<dynamic>)
          .map((e) => House.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HouseWrapperToJson(HouseWrapper instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

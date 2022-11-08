// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TokenWrapper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenWrapper _$TokenWrapperFromJson(Map<String, dynamic> json) => TokenWrapper(
      json['token'] as String,
      RefreshToken.fromJson(json['refreshToken'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TokenWrapperToJson(TokenWrapper instance) =>
    <String, dynamic>{
      'token': instance.token,
      'refreshToken': instance.refreshToken,
    };

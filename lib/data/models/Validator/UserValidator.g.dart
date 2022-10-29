// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserValidator.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserValidator _$UserValidatorFromJson(Map<String, dynamic> json) =>
    UserValidator(
      json['email'] as String,
      json['password'] as String,
    );

Map<String, dynamic> _$UserValidatorToJson(UserValidator instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };

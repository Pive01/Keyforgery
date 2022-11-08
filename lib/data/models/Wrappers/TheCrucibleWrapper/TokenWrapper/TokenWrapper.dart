import 'package:json_annotation/json_annotation.dart';

import 'RefreshToken.dart';

part 'TokenWrapper.g.dart';

@JsonSerializable()
class TokenWrapper {
  String token;
  RefreshToken refreshToken;

  TokenWrapper(this.token,this.refreshToken);

  factory TokenWrapper.fromJson(Map<String, dynamic> json) => _$TokenWrapperFromJson(json);
  Map<String, dynamic> toJson() => _$TokenWrapperToJson(this);
}
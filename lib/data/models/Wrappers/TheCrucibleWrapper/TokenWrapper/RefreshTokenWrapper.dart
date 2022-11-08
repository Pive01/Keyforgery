
import 'package:json_annotation/json_annotation.dart';

import 'RefreshToken.dart';

part 'RefreshTokenWrapper.g.dart';

@JsonSerializable()
class RefreshTokenWrapper{
  RefreshToken token;

  RefreshTokenWrapper(this.token);

  factory RefreshTokenWrapper.fromJson(Map<String, dynamic> json) => _$RefreshTokenWrapperFromJson(json);
  Map<String, dynamic> toJson() => _$RefreshTokenWrapperToJson(this);
}
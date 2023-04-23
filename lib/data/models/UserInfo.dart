import 'package:json_annotation/json_annotation.dart';

part 'UserInfo.g.dart';

@JsonSerializable()
class UserInfo {
  String username;

  UserInfo(this.username);

  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoToJson(this);
}

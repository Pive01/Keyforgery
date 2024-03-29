import 'package:json_annotation/json_annotation.dart';

part 'RefreshToken.g.dart';

@JsonSerializable()
class RefreshToken {
  int id;
  String username;
  String token;

  RefreshToken(this.id, this.username, this.token);

  @override
  String toString() {
    return 'RefreshToken{id: $id, username: $username, token: $token}';
  }

  factory RefreshToken.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenFromJson(json);

  Map<String, dynamic> toJson() => _$RefreshTokenToJson(this);
}

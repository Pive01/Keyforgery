
import 'package:json_annotation/json_annotation.dart';

part 'CrucibleLogin.g.dart';
@JsonSerializable()
class CrucibleLogin{
  String username;
  String password;

  CrucibleLogin(this.username, this.password);

  factory CrucibleLogin.fromJson(Map<String, dynamic> json) => _$CrucibleLoginFromJson(json);
  Map<String, dynamic> toJson() => _$CrucibleLoginToJson(this);
}
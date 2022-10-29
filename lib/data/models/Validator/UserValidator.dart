
import 'package:json_annotation/json_annotation.dart';

part 'UserValidator.g.dart';
@JsonSerializable()
class UserValidator{
  String email;
  String password;

  UserValidator(this.email, this.password);

  factory UserValidator.fromJson(Map<String, dynamic> json) => _$UserValidatorFromJson(json);
  Map<String, dynamic> toJson() => _$UserValidatorToJson(this);
}
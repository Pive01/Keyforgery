
import 'package:json_annotation/json_annotation.dart';
part 'GetDecksConstraintReqBody.g.dart';

@JsonSerializable()
class GetDecksConstraintReqBody{
  String property;
  String cap; // TODO transform to enum
  int value;

  GetDecksConstraintReqBody(this.property, this.cap, this.value);

  factory GetDecksConstraintReqBody.fromJson(Map<String, dynamic> json) => _$GetDecksConstraintReqBodyFromJson(json);

  Map<String, dynamic> toJson() => _$GetDecksConstraintReqBodyToJson(this);
}
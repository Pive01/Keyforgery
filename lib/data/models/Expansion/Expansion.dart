import 'package:json_annotation/json_annotation.dart';

part 'Expansion.g.dart';

@JsonSerializable(explicitToJson: true)
class Expansion {
  int set_id;
  String name;

  Expansion(this.set_id, this.name);

  factory Expansion.fromJson(Map<String, dynamic> json) =>
      _$ExpansionFromJson(json);

  Map<String, dynamic> toJson() => _$ExpansionToJson(this);
}

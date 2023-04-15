import 'package:json_annotation/json_annotation.dart';

part 'Expansion.g.dart';
@JsonSerializable(explicitToJson: true)
class Expansion {
  String expansion;
  String image;

  Expansion(this.expansion, this.image);

  @override
  String toString() {
    return 'Expansion{expansion: $expansion, image: $image}';
  }

  factory Expansion.fromJson(Map<String, dynamic> json) => _$ExpansionFromJson(json);
  Map<String, dynamic> toJson() => _$ExpansionToJson(this);
}
import 'package:json_annotation/json_annotation.dart';

import '../../../../House/House.dart';

part 'Linked.g.dart';

@JsonSerializable()
class Linked {
  List<House> houses;

  Linked(this.houses);

  @override
  String toString() {
    return 'Linked{houses: $houses}';
  }

  factory Linked.fromJson(Map<String, dynamic> json) => _$LinkedFromJson(json);
  Map<String, dynamic> toJson() => _$LinkedToJson(this);
}
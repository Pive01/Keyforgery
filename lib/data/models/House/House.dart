import 'package:json_annotation/json_annotation.dart';

part 'House.g.dart';
@JsonSerializable()
class House {
  String id;
  String name;
  String? image;

  House(this.id, this.name, this.image);

  @override
  String toString() {
    return 'House{id: $id, name: $name, image: $image}';
  }

  factory House.fromJson(Map<String, dynamic> json) => _$HouseFromJson(json);
  Map<String, dynamic> toJson() => _$HouseToJson(this);
}
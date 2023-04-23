import 'package:json_annotation/json_annotation.dart';

import '../../House/House.dart';

part 'HouseWrapper.g.dart';

@JsonSerializable()
class HouseWrapper {
  List<House> data;

  HouseWrapper(this.data);

  @override
  String toString() {
    return 'HouseWrapper{data: $data}';
  }

  factory HouseWrapper.fromJson(Map<String, dynamic> json) =>
      _$HouseWrapperFromJson(json);

  Map<String, dynamic> toJson() => _$HouseWrapperToJson(this);
}

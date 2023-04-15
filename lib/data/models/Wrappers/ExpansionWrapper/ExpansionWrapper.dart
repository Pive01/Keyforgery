import 'package:json_annotation/json_annotation.dart';

import '../../Expansion/Expansion.dart';

part 'ExpansionWrapper.g.dart';
@JsonSerializable()
class ExpansionWrapper {
  List<Expansion> data;

  ExpansionWrapper(this.data);


  factory ExpansionWrapper.fromJson(Map<String, dynamic> json) => _$ExpansionWrapperFromJson(json);
  Map<String, dynamic> toJson() => _$ExpansionWrapperToJson(this);
}
import 'package:json_annotation/json_annotation.dart';

part 'FilterCount.g.dart';

@JsonSerializable()
class FilterCount{
  int count;
  int pages;

  FilterCount(
      this.count, this.pages);

  factory FilterCount.fromJson(Map<String, dynamic> json) => _$FilterCountFromJson(json);
  Map<String, dynamic> toJson() => _$FilterCountToJson(this);
}
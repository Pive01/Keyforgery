import 'package:json_annotation/json_annotation.dart';

import '../Deck.dart';
part 'FilterWrapper.g.dart';

@JsonSerializable()
class FilterWrapper{
  int page;
  List<Deck> decks;

  FilterWrapper(this.page, this.decks);

  factory FilterWrapper.fromJson(Map<String, dynamic> json) => _$FilterWrapperFromJson(json);

  Map<String, dynamic> toJson() => _$FilterWrapperToJson(this);
}
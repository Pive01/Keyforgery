import 'package:json_annotation/json_annotation.dart';
import 'package:keyforgery/data/models/DeckModel/MVDeck/MVDeck.dart';

import '../Linked/Linked.dart';

part 'MVCardsWrapper.g.dart';

@JsonSerializable()
class MVCardsWrapper {
  MVDeck data;
  @JsonKey(name: '_linked')
  Linked linked;

  @override
  String toString() {
    return 'MVCardsWrapper{data: $data, linked: $linked}';
  }

  MVCardsWrapper(this.data, this.linked);

  factory MVCardsWrapper.fromJson(Map<String, dynamic> json) =>
      _$MVCardsWrapperFromJson(json);

  Map<String, dynamic> toJson() => _$MVCardsWrapperToJson(this);
}

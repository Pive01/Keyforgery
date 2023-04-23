import 'package:json_annotation/json_annotation.dart';
import 'package:keyforgery/data/models/Wrappers/TheCrucibleWrapper/CrucibleDeck/CrucibleDeck.dart';

part 'CrucibleDecksWrapper.g.dart';

@JsonSerializable()
class CrucibleDecksWrapper {
  bool success;
  List<CrucibleDeck> decks;

  @override
  String toString() {
    return 'CrucibleDecksWrapper{success: $success, decks: $decks}';
  }

  CrucibleDecksWrapper(this.decks, this.success);

  factory CrucibleDecksWrapper.fromJson(Map<String, dynamic> json) =>
      _$CrucibleDecksWrapperFromJson(json);

  Map<String, dynamic> toJson() => _$CrucibleDecksWrapperToJson(this);
}

import 'package:json_annotation/json_annotation.dart';

part 'GetDecksCardReqBody.g.dart';

@JsonSerializable()
class GetDecksCardReqBody {
  List<String> cardNames;
  int quantity;

  GetDecksCardReqBody(this.cardNames, this.quantity);

  factory GetDecksCardReqBody.fromJson(Map<String, dynamic> json) =>
      _$GetDecksCardReqBodyFromJson(json);

  Map<String, dynamic> toJson() => _$GetDecksCardReqBodyToJson(this);
}

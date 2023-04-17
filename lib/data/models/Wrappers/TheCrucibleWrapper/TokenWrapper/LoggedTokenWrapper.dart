import 'package:json_annotation/json_annotation.dart';

part 'LoggedTokenWrapper.g.dart';

@JsonSerializable()
class LoggedTokenWrapper {
  String token;

  LoggedTokenWrapper(this.token);

  factory LoggedTokenWrapper.fromJson(Map<String, dynamic> json) =>
      _$LoggedTokenWrapperFromJson(json);
  Map<String, dynamic> toJson() => _$LoggedTokenWrapperToJson(this);
}

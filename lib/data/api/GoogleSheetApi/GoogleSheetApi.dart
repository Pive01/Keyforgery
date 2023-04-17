import 'package:dio/dio.dart';
import 'package:keyforgery/data/models/Wrappers/ExpansionWrapper/ExpansionWrapper.dart';
import 'package:retrofit/http.dart';

part 'GoogleSheetApi.g.dart';

@RestApi(baseUrl: "https://script.google.com/macros/s/")
abstract class GoogleSheetApi {
  factory GoogleSheetApi(Dio dio, {String baseUrl}) = _GoogleSheetApi;

  @GET(
      "AKfycby9FjaR_w4T-jqeW_93MtEcd_pyGQ5GMaIzd_3B41eawzDgHm72tkveS6Br3hrUZqd3/exec")
  Future<ExpansionWrapper> getAllExpansions();
}

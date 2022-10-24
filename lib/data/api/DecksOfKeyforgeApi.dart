
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/http.dart';

import '../models/Deck.dart';
import '../models/DokFilterWrappers/FilterWrapper.dart';
import '../models/DokFilterWrappers/ReqBody/GetDecksReqBody.dart';

part 'DecksOfKeyforgeApi.g.dart';

@RestApi(baseUrl: "https://decksofkeyforge.com/api/")
abstract class DecksOfKeyforgeApi {
  factory DecksOfKeyforgeApi(Dio dio, {String baseUrl}) = _DecksOfKeyforgeApi;

  @GET("decks/by-name/{name}")
  Future<List<Deck>> getDecksByNamePreview(@Path("name") String name);

  @POST("decks/filter")
  Future<FilterWrapper> getDecksByName(@Body() GetDecksReqBody body);
}

class Api {

}
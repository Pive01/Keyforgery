import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/http.dart';

import '../../models/DeckModel/Deck/Deck.dart';
import '../../models/Validator/UserValidator.dart';
import '../../models/Wrappers/DokWrappers/DokFilterWrappers/FilterWrapper/FilterWrapper.dart';
import '../../models/Wrappers/DokWrappers/DokFilterWrappers/ReqBody/GetDecksReqBody/GetDecksReqBody.dart';

part 'DecksOfKeyforgeApi.g.dart';

@RestApi(baseUrl: "https://decksofkeyforge.com/api/")
abstract class DecksOfKeyforgeApi {
  factory DecksOfKeyforgeApi(Dio dio, {String baseUrl}) = _DecksOfKeyforgeApi;

  @GET("decks/by-name/{name}")
  Future<List<Deck>> getDecksByNamePreview(@Path("name") String name);

  @POST("decks/filter")
  Future<FilterWrapper> getDecksByName(@Body() GetDecksReqBody body);

  @POST("decks/filter")
  Future<FilterWrapper> importDecks(@Body() GetDecksReqBody body);

  @POST("users/login")
  Future<void> getAuthorization(@Body() UserValidator usr);
}
import 'package:dio/dio.dart' hide Headers;
import 'package:keyforgery/data/models/Wrappers/DokWrappers/WithSynergiesWrapper.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/DeckModel/Deck/Deck.dart';
import '../../models/UserInfo.dart';
import '../../models/Validator/UserValidator.dart';
import '../../models/Wrappers/DokWrappers/DokFilterWrappers/FilterWrapper/FilterWrapper.dart';
import '../../models/Wrappers/DokWrappers/DokFilterWrappers/ReqBody/GetDecksReqBody/GetDecksReqBody.dart';

part 'DecksOfKeyforgeApi.g.dart';

@RestApi(baseUrl: "https://decksofkeyforge.com/api/")
abstract class DecksOfKeyforgeApi {
  factory DecksOfKeyforgeApi(Dio dio, {String baseUrl}) = _DecksOfKeyforgeApi;

  @GET("decks/by-name/{name}")
  Future<List<Deck>> getDecksByNamePreview(@Path("name") String name);

  @GET("decks/with-synergies/{id}")
  Future<WithSynergiesWrapper> getDeckById(@Path("id") String id);

  @POST("decks/filter")
  Future<FilterWrapper> getDecksByName(@Body() GetDecksReqBody body);

  @POST("decks/filter")
  Future<FilterWrapper> importDecks(@Body() GetDecksReqBody body);

  @POST("users/login")
  Future<HttpResponse<void>> getAuthorization(@Body() UserValidator usr);

  @GET("users/secured/your-user")
  Future<UserInfo> getUserName(@Header("authorization") String auth);
}
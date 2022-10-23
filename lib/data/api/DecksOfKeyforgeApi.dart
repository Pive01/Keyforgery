
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../models/Deck.dart';

part 'DecksOfKeyforgeApi.g.dart';

@RestApi(baseUrl: "https://decksofkeyforge.com/api/")
abstract class DecksOfKeyforgeApi {
  factory DecksOfKeyforgeApi(Dio dio, {String baseUrl}) = _DecksOfKeyforgeApi;

  @GET("decks/by-name/{name}")
  Future<List<Deck>> getDecksByName(@Path("name") String name);
}

class Api {

}

import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import '../models/HouseWrapper.dart';

part 'MasterVaultApi.g.dart';

@RestApi(baseUrl: "https://www.keyforgegame.com/api/")
abstract class MasterVaultApi {
  factory MasterVaultApi(Dio dio, {String baseUrl}) = _MasterVaultApi;

  @GET("decks/houses/")
  Future<HouseWrapper> getAllHouses();
}

class Api {

}
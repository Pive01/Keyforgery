import 'package:dio/dio.dart';
import 'package:keyforgery/data/models/Wrappers/ExpansionWrapper/ExpansionWrapper.dart';
import 'package:keyforgery/data/models/Wrappers/MasterVaultWrappers/linkCards/MVCardsWrapper/MVCardsWrapper.dart';
import 'package:retrofit/http.dart';

import '../../models/Wrappers/HouseWrapper/HouseWrapper.dart';

part 'MasterVaultApi.g.dart';

@RestApi(baseUrl: "https://www.keyforgegame.com/api/")
abstract class MasterVaultApi {
  factory MasterVaultApi(Dio dio, {String baseUrl}) = _MasterVaultApi;

  @GET("decks/houses/")
  Future<HouseWrapper> getAllHouses();

  @GET("decks/expansions/")
  Future<ExpansionWrapper> getAllExpansions();

  @GET("decks/{keyforgeId}/?links=cards")
  Future<MVCardsWrapper> getCards(@Path("keyforgeId") String deckId);
}

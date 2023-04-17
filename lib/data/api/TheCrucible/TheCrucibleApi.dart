import 'package:dio/dio.dart';
import 'package:keyforgery/data/models/Validator/CrucibleLogin.dart';
import 'package:keyforgery/data/models/Wrappers/TheCrucibleWrapper/CrucibleDecksWrapper/CrucibleDecksWrapper.dart';
import 'package:retrofit/http.dart';

import '../../models/Wrappers/TheCrucibleWrapper/TokenWrapper/RefreshTokenWrapper.dart';
import '../../models/Wrappers/TheCrucibleWrapper/TokenWrapper/LoggedTokenWrapper.dart';
import '../../models/Wrappers/TheCrucibleWrapper/TokenWrapper/TokenWrapper.dart';

part 'TheCrucibleApi.g.dart';

@RestApi(baseUrl: "https://thecrucible.online/api/")
abstract class TheCrucibleApi {
  factory TheCrucibleApi(Dio dio, {String baseUrl}) = _TheCrucibleApi;

  @POST("account/login")
  Future<TokenWrapper> getAuthorization(@Body() CrucibleLogin usr);

  @POST("account/token")
  Future<LoggedTokenWrapper> refreshAuthorization(
      @Body() RefreshTokenWrapper token);

  @GET("decks?pageSize=1000&page=1&sort=lastUpdated&sortDir=desc")
  Future<CrucibleDecksWrapper> getCrucibleDecks(
      @Header("Authorization") String auth);
}

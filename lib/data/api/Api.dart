import 'dart:io';

import 'package:dio/dio.dart';
import 'package:keyforgery/data/api/TheCrucible/TheCrucibleApi.dart';
import 'package:keyforgery/data/models/Validator/CrucibleLogin.dart';
import 'package:keyforgery/data/models/Validator/UserValidator.dart';
import 'package:retrofit/retrofit.dart';

import '../models/DeckModel/Deck/Deck.dart';
import '../models/Wrappers/DokWrappers/DokFilterWrappers/FilterWrapper/FilterWrapper.dart';
import '../models/Wrappers/DokWrappers/DokFilterWrappers/ReqBody/GetDecksReqBody/GetDecksReqBody.dart';
import '../models/Wrappers/DokWrappers/WithSynergiesWrapper.dart';
import '../models/Wrappers/HouseWrapper/HouseWrapper.dart';
import '../models/Wrappers/MasterVaultWrappers/linkCards/MVCardsWrapper/MVCardsWrapper.dart';
import '../models/Wrappers/TheCrucibleWrapper/CrucibleDecksWrapper/CrucibleDecksWrapper.dart';
import '../models/Wrappers/TheCrucibleWrapper/TokenWrapper/RefreshTokenWrapper.dart';
import '../models/Wrappers/TheCrucibleWrapper/TokenWrapper/TokenWrapper.dart';
import 'DecksOfKeyforgeApi/DecksOfKeyforgeApi.dart';
import 'MasterVaultApi/MasterVaultApi.dart';

class Api {

  static final dokClient = DecksOfKeyforgeApi(Dio(
      BaseOptions(contentType: "application/json", headers: {'Timezone': 60})));
  static final masterVaultClient = MasterVaultApi(Dio());
  static final theCrucibleClient = TheCrucibleApi(Dio());

  static Future<List<Deck>> getDecksByNamePreview(String name) {
    return dokClient.getDecksByNamePreview(name);
  }

  static Future<FilterWrapper> getDecksByName(GetDecksReqBody req) {
    return dokClient.getDecksByName(req);
  }

  static Future<FilterWrapper> getDecksByUserName(GetDecksReqBody req) {
    return dokClient.importDecks(req);
  }

  static Future<WithSynergiesWrapper> getDeckById(String id) {
    return dokClient.getDeckById(id);
  }

  static Future<HouseWrapper> getAllHouses() {
    return masterVaultClient.getAllHouses();
  }

  static Future<MVCardsWrapper> getCards(String id) {
    return masterVaultClient.getCards(id);
  }

  static Future<HttpResponse<void>> getAuthorization(UserValidator usrV) {
    return dokClient.getAuthorization(usrV);
  }

  static Future<TokenWrapper> getCrucibleToken(CrucibleLogin usrV) {
    return theCrucibleClient.getAuthorization(usrV);
  }

  static Future<CrucibleDecksWrapper> getCrucibleDecks(String token) {
    return theCrucibleClient.getCrucibleDecks(token);
  }

  static Future<void> sendToken(RefreshTokenWrapper token) {
    return theCrucibleClient.sendToken(token);
  }

}

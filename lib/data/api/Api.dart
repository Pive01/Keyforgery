import 'dart:io';

import 'package:dio/dio.dart';
import 'package:keyforgery/data/models/Validator/UserValidator.dart';

import '../models/DeckModel/Deck/Deck.dart';
import '../models/Wrappers/DokWrappers/DokFilterWrappers/FilterWrapper/FilterWrapper.dart';
import '../models/Wrappers/DokWrappers/DokFilterWrappers/ReqBody/GetDecksReqBody/GetDecksReqBody.dart';
import '../models/Wrappers/HouseWrapper/HouseWrapper.dart';
import '../models/Wrappers/MasterVaultWrappers/linkCards/MVCardsWrapper/MVCardsWrapper.dart';
import 'DecksOfKeyforgeApi/DecksOfKeyforgeApi.dart';
import 'MasterVaultApi/MasterVaultApi.dart';

class Api {
  static final dokClient = DecksOfKeyforgeApi(Dio(
      BaseOptions(contentType: "application/json", headers: {'Timezone': 60})));
  static final masterVaultClient = MasterVaultApi(Dio());

  static Future<List<Deck>> getDecksByNamePreview(String name) {
    return dokClient.getDecksByNamePreview(name);
  }

  static Future<FilterWrapper> getDecksByName(GetDecksReqBody req) {
    return dokClient.getDecksByName(req);
  }

  static Future<FilterWrapper> getDecksByUserName(GetDecksReqBody req) {
    return dokClient.importDecks(req);
  }

  static Future<HouseWrapper> getAllHouses() {
    return masterVaultClient.getAllHouses();
  }

  static Future<MVCardsWrapper> getCards(String id) {
    return masterVaultClient.getCards(id);
  }

  static Future<void> getAuthorization(UserValidator usrV) {
    return dokClient.getAuthorization(usrV);
  }

}

import 'package:dio/dio.dart';

import '../models/DeckModel/Deck/Deck.dart';
import '../models/Wrappers/DokWrappers/DokFilterWrappers/FilterWrapper/FilterWrapper.dart';
import '../models/Wrappers/DokWrappers/DokFilterWrappers/ReqBody/GetDecksReqBody/GetDecksReqBody.dart';
import '../models/Wrappers/HouseWrapper/HouseWrapper.dart';
import 'DecksOfKeyforgeApi.dart';
import 'MasterVaultApi.dart';

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

  static Future<HouseWrapper> getAllHouses() {
    return masterVaultClient.getAllHouses();
  }
}

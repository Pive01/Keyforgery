import 'package:dio/dio.dart';

import '../models/Deck.dart';
import '../models/HouseWrapper.dart';
import 'DecksOfKeyforgeApi.dart';
import 'MasterVaultApi.dart';

class Api {
  static final dokClient = DecksOfKeyforgeApi(Dio());
  static final masterVaultClient = MasterVaultApi(Dio());

  static Future<List<Deck>> getDecksByName(String name) {
    return dokClient.getDecksByName(name);
  }

  static Future<HouseWrapper> getAllHouses() {
    return masterVaultClient.getAllHouses();
  }
}
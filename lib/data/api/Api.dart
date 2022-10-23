import 'package:dio/dio.dart';

import '../models/Deck.dart';
import 'DecksOfKeyforgeApi.dart';

class Api {
  static final dokClient = DecksOfKeyforgeApi(Dio());

  static Future<List<Deck>> getDecksByName(String name) {
    return dokClient.getDecksByName(name);
  }
}
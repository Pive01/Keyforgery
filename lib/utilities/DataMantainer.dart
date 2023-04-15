import 'package:keyforgery/data/models/Expansion/Expansion.dart';
import 'package:keyforgery/data/models/Wrappers/ExpansionWrapper/ExpansionWrapper.dart';
import 'package:keyforgery/utilities/utils.dart';

import '../data/models/Wrappers/HouseWrapper/HouseWrapper.dart';

const String untamedLogo =
    'https://cdn.keyforgegame.com/media/houses/Untamed_bXh9SJD.png';

class LogoConverter {
  static late HouseWrapper _dataHouses;
  static late ExpansionWrapper _dataExpansion;

  static void init(HouseWrapper houses, ExpansionWrapper expansions) {
    _dataHouses = houses;
    _dataExpansion = expansions;
  }

  static HouseWrapper getHousesInfo() {
    return _dataHouses;
  }

  static List<Expansion> getExpansionsInfo() {
    return _dataExpansion.data;
  }

  static String getLinkFromName(String houseName) {
    for (final house in _dataHouses.data) {
      if (house.name.makeKfFriendly() == houseName.makeKfFriendly()) {
        return house.image ?? untamedLogo;
      }
    }
    return untamedLogo;
  }
}

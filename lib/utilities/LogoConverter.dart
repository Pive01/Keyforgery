import 'package:keyforgery/utilities/utils.dart';

import '../data/models/Wrappers/HouseWrapper/HouseWrapper.dart';

const String untamedLogo = 'https://cdn.keyforgegame.com/media/houses/Untamed_bXh9SJD.png';
class LogoConverter {
  static late HouseWrapper _data;

  static void init(HouseWrapper data) {
    _data = data;
  }

  static String getLinkFromName(String houseName) {
    for (final house in _data.data) {
      if (house.name.makeKfFriendly() == houseName.makeKfFriendly()) {
        return  house.image ?? untamedLogo;
      }
    }
    return untamedLogo;
  }
}

import 'package:keyforgery/data/models/HouseWrapper.dart';

String UNTAMED_LOGO = 'https://cdn.keyforgegame.com/media/houses/Untamed_bXh9SJD.png';
class LogoConverter {
  static late HouseWrapper _data;

  static void Init(HouseWrapper data) {
    _data = data;
  }

  static String getLinkFromName(String houseName) {
    for (final house in _data.data) {
      if (house.name.split(' ').join() == houseName) {
        return house.image != null ? house.image! : UNTAMED_LOGO;
      }
    }
    return UNTAMED_LOGO;
  }
}

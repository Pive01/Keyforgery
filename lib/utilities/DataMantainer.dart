import 'package:download_assets/download_assets.dart';
import 'package:keyforgery/data/models/Expansion/Expansion.dart';
import 'package:keyforgery/data/models/Wrappers/ExpansionWrapper/ExpansionWrapper.dart';
import 'package:keyforgery/utilities/utils.dart';

import '../data/models/Wrappers/HouseWrapper/HouseWrapper.dart';

const String untamedLogo =
    'https://cdn.keyforgegame.com/media/houses/Untamed_bXh9SJD.png';

class DataMantainer {
  static late HouseWrapper _dataHouses;
  static late ExpansionWrapper _dataExpansion;
  static late DownloadAssetsController _downloadAssetsController;

  static void init(HouseWrapper houses, ExpansionWrapper expansions,
      DownloadAssetsController downloadAssetsController) {
    _dataHouses = houses;
    _dataExpansion = expansions;
    _downloadAssetsController = downloadAssetsController;
  }

  static HouseWrapper getHousesInfo() {
    return _dataHouses;
  }

  static List<Expansion> getExpansionsInfo() {
    _dataExpansion.data.removeWhere((element) => element.set_id == 452);
    return _dataExpansion.data;
  }

  static DownloadAssetsController getAssetController() {
    return _downloadAssetsController;
  }

  static String getExpansionLogoFromName(String expansionName) {
    print(expansionName);
    return expansionName
        .toUpperCase()
        .replaceAll(" ", "_");
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

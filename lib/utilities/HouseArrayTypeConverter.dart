import 'package:floor/floor.dart';

import '../data/models/DeckModel/HouseAndCards/HousesAndCards.dart';

class HouseArrayTypeConverter extends TypeConverter<List<HousesAndCards>,String>{
 static const String DIVIDER = ",";
  @override
  List<HousesAndCards> decode(String databaseValue) {
    return databaseValue.split(DIVIDER).map((e) => HousesAndCards(e)).toList();
  }

  @override
  String encode(List<HousesAndCards> value) {
    return value.map((e) => e.house).join(DIVIDER);
  }
}

class FilterObject {
  List<String> houses = [];
  FilterObject();

  void addHouse(String house){
    houses.add(house);
  }

  void removeHouse(String house){
    houses.remove(house);
  }

  bool containsHouse(String house){
    return houses.contains(house);
  }
}
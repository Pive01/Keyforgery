import 'package:shared_preferences/shared_preferences.dart';

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

String convertSetName(String setName){
  return setName.split(RegExp(r'_')).map((str) => str.capitalize()).join(' ');
}
String convertSetToAbbreviation(String setName){
  return setName.split(' ').map((e) => e.capitalize()[0]).join("");
}

class SharedPrefs {

  static const String _displayPropKey = "displayPropName";

  static Future<void> setDisplayProp(String propName) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(_displayPropKey, propName);
  }

  static Future<String> getDisplayProp() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_displayPropKey) ?? "rawAmber";
  }
}

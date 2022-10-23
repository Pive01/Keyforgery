extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

String convertSetName(String setName){
  return setName.split(RegExp(r'_')).map((str) => str.capitalize()).join(' ');
}

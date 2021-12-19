class Validator {
  RegExp regex = RegExp(r'^(?:[a-zA-Z]|\P{L})+$', unicode: true);

  bool validateCharacters(String text) {
    return regex.hasMatch(text);
  }

  bool validateKeywordLength(String keyword) {
    return keyword.length == 8;
  }
}

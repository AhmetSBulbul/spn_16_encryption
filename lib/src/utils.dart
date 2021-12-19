RegExp regExp = RegExp(r'^(?:[a-zA-Z]|\P{L})+$', unicode: true);

bool validateKeywordLength(String keyword) => keyword.length == 8;

import 'key_spn.dart';
import 'utils.dart';

import 'digest_spn.dart';
import 'dart:typed_data';

class Spn16 {
  static DigestSpn convert(DigestSpn digest, KeySpn key) {
    Uint8List bytes = digest.bytes;
    for (var i = 0; i < digest.toString().length / 2; i++) {
      for (var z = 0; z < 4; z++) {
        bytes[i * 2] = digest.bytes[i * 2] ^ key.bytes[z * 2];
        bytes[(i * 2) + 1] = digest.bytes[(i * 2) + 1] ^ key.bytes[(z * 2) + 1];
      }
    }

    return DigestSpn(bytes);
  }

  static bool validateKeyLength(String keyText) =>
      validateKeywordLength(keyText);

  static bool validateText(String text) => regExp.hasMatch(text);
}

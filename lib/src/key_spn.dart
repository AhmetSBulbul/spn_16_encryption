import 'dart:convert';
import 'dart:typed_data';

import 'package:spn_16_encryption/src/utils.dart';

import 'digest_spn.dart';

class KeySpn extends DigestSpn {
  KeySpn(Uint8List bytes) : super(bytes);

  static KeySpn fromString(String text) {
    if (regExp.hasMatch(text) && validateKeywordLength(text)) {
      return KeySpn(Uint8List.fromList(utf8.encode(text)));
    } else {
      throw const FormatException(
          "Keyword must be 8 characters with valid values.");
    }
  }
}

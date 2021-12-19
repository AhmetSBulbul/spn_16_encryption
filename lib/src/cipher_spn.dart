import 'dart:convert';
import 'dart:typed_data';

import 'package:spn_16_encryption/src/utils.dart';

import 'digest_spn.dart';

class CipherSpn extends DigestSpn {
  CipherSpn(Uint8List bytes) : super(bytes);

  static CipherSpn fromString(String text) {
    if (regExp.hasMatch(text) && validateKeywordLength(text)) {
      return CipherSpn(Uint8List.fromList(utf8.encode(text)));
    } else {
      throw const FormatException(
          "Cipher text must be 8 characters with valid values.");
    }
  }
}

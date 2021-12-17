import 'dart:convert';

import 'package:spn_16_encryption/src/message.dart';

class CipherText extends Message {
  @override
  CipherText(String text) : super(text) {
    if (text.length != 8) {
      throw FormatException("Cipher text must be 8 characters");
    } else {
      super.bytes = utf8.encode(text);
    }
  }
  CipherText.fromBytes(List<int> bytes) : super.fromBytes(bytes);
  List<int> get asBytes => super.bytes;
  String get asText => super.text;
}

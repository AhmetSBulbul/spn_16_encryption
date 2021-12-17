import 'dart:convert';

import 'package:spn_16_encryption/src/message.dart';

class EncryptedText extends Message {
  EncryptedText(String text) : super(text);
  EncryptedText.fromBytes(List<int> bytes) : super.fromBytes(bytes);

  List<int> get asBytes => super.bytes;
  String get asText => super.text;
}

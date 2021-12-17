import 'package:spn_16_encryption/src/message.dart';

class CipherText extends Message {
  CipherText(String text) : super(text);
  CipherText.fromBytes(List<int> bytes) : super.fromBytes(bytes);
  List<int> get asBytes => super.bytes;
  String get asText => super.text;
}

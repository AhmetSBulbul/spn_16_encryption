import 'package:spn_16_encryption/src/message.dart';

class EncryptedText extends Message {
  @override
  EncryptedText(String text) : super(text) {
    super.bytes = text.codeUnits;
  }

  @override
  EncryptedText.fromBytes(List<int> bytes) : super.fromBytes(bytes) {
    super.text = String.fromCharCodes(bytes);
  }

  List<int> get asBytes => super.bytes;
  String get asText => super.text;
}

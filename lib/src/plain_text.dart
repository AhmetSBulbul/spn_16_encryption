import 'package:spn_16_encryption/src/message.dart';

class PlainText extends Message {
  PlainText(String text) : super(text);
  PlainText.fromBytes(List<int> bytes) : super.fromBytes(bytes);
  List<int> get asBytes => super.bytes;
  String get asText => super.text;
}

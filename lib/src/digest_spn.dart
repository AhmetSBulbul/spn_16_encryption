import 'dart:convert';
import 'dart:typed_data';
import 'utils.dart';

class DigestSpn {
  final Uint8List bytes;
  DigestSpn(this.bytes);

  @override
  String toString() => _hexEncode(bytes);

  String _hexEncode(Uint8List bytes) {
    return utf8.decode(bytes);
  }

  static DigestSpn fromString(String text) {
    if (regExp.hasMatch(text)) {
      text = text.length % 2 == 0 ? text : text + " ";
      return DigestSpn(Uint8List.fromList(utf8.encode(text)));
    } else {
      throw const FormatException("Invalid value");
    }
  }
}

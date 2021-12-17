import 'dart:convert';

abstract class Message {
  late String text;
  late List<int> bytes;

  Message(this.text) {
    bytes = utf8.encode(text);
  }

  Message.fromBytes(this.bytes) {
    text = utf8.decode(bytes);
  }
}

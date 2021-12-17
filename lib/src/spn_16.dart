import 'cipher.dart';
import 'encrypted_text.dart';
import 'plain_text.dart';

class SPN16 {
  List<int> _encryption(
      {required List<int> bytesText, required List<int> bytesCipher}) {
    List<int> bytesSubject = bytesText;
    for (var i = 0; i < bytesText.length / 2; i++) {
      for (var z = 0; z < 4; z++) {
        bytesSubject[i * 2] = bytesText[i * 2] ^ bytesCipher[z * 2];
        bytesSubject[(i * 2) + 1] =
            bytesText[(i * 2) + 1] ^ bytesCipher[(z * 2) + 1];
      }
    }
    return bytesSubject;
  }

  String encrypt({required String plainText, required String keyword}) {
    try {
      plainText = plainText.length % 2 == 0 ? plainText : plainText + " ";
      return EncryptedText.fromBytes(_encryption(
              bytesText: PlainText(plainText).asBytes,
              bytesCipher: CipherText(keyword).asBytes))
          .asText;
    } on FormatException {
      return "Failed";
    }
  }

  String decyrpt({required String encryptedText, required String keyword}) {
    try {
      return PlainText.fromBytes(_encryption(
              bytesText: EncryptedText(encryptedText).asBytes,
              bytesCipher: CipherText(keyword).asBytes))
          .asText;
    } on FormatException {
      return "Failed";
    }
  }
}


/*import 'dart:typed_data';
import 'dart:convert';
void main() {
  String message = "Selam, ben Ahmet Safa Bülbül🧓🏼";
  String keyword = 'parolaola';
  print(message);
  print(message.length);
  if(message.length % 2 != 0){
    message = message + ' ';
  }
  print(message);
  print(message.length);
  
  List<int> keyCode = getCodes(keyword);
  List<int> encryptedCodes = encryption(getCodes(message), keyCode);
  String encryptedMessage = String.fromCharCodes(encryptedCodes);
  print(encryptedMessage);
  String decodedMessage = getText(encryption(encryptedCodes, keyCode));
  
}


List<int> getCodes(String plainText){
  return utf8.encode(plainText);
}

List<int> encryption(List<int> plainCode, List<int> keyCodes){
  List<int> cipherCode = plainCode;
  //print('\n\n');
  for(var i = 0; i < plainCode.length/2; i++){
    for(var z = 0; z < 4; z++){
      //print('cipher:' + cipherCode[i*2].toRadixString(2) + " " + cipherCode[(i*2) + 1].toRadixString(2) + '\n');
      //print('keyCode:' + keyCodes[z*2].toRadixString(2) + " " + keyCodes[(z*2) + 1].toRadixString(2) + '\n');
      cipherCode[i * 2] = cipherCode[i * 2] ^ keyCodes[z * 2];
      cipherCode[(i * 2) + 1] = cipherCode[(i * 2) + 1] ^ keyCodes[(z * 2) + 1];
    }
  }
  
  return cipherCode;
}


String getText(List<int> codes){
  String text = utf8.decode(codes);
  print('codes:' + codes.toString() + '\ntext:' + text);
  return text;
} */
import 'package:flutter_test/flutter_test.dart';

import 'package:spn_16_encryption/spn_16_encryption.dart';

void main() {
  final spn = SPN16();
  test('encryption with valid values', () {
    expect(
        spn.encrypt(
            plainText: "Hey, this is a plain text.", keyword: "parolaol"),
        "Ifx/!wijr#hp!b!smbhm!wd{u-");
  });

  test('decryption with valid values', () {
    expect(
        spn.decyrpt(
            encryptedText: "Ifx/!wijr#hp!b!smbhm!wd{u-", keyword: "parolaol"),
        "Hey, this is a plain text.");
  });

  test('non-valid keyword length', () {
    expect(
        () => spn.encrypt(
            plainText: "Hey, this is a plain text.", keyword: 'parolaaaaaa'),
        throwsFormatException);
  });

  test('non-valid characters in text', () {
    expect(
        () => spn.encrypt(
            plainText: "Selam, türkçe karakter ve emoji kullanıyorum. 😎",
            keyword: 'parolaol'),
        throwsFormatException);
  });
}

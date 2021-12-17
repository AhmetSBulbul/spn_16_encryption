import 'package:flutter_test/flutter_test.dart';

import 'package:spn_16_encryption/spn_16_encryption.dart';

void main() {
  test('encryption', () {
    final spn = SPN16();
    expect(spn.encrypt(plainText: "Selam", keyword: "parolaol"), "Rfmbl#");
  });

  test('decryption', () {
    final spn = SPN16();
    expect(
        spn.decyrpt(encryptedText: "Rfmbl#", keyword: "parolaol").trimRight(),
        "Selam");
  });

  test('format Error', () {
    final spn = SPN16();
    expect(spn.encrypt(plainText: "Selam", keyword: "parola"), "Failed");
  });

  /*test('adds one to input values', () {
    final calculator = Calculator();
    expect(calculator.addOne(2), 3);
    expect(calculator.addOne(-7), -6);
    expect(calculator.addOne(0), 1);
  });*/
}

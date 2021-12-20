import 'package:flutter_test/flutter_test.dart';
import 'package:spn_16_encryption/src/key_spn.dart';
import 'package:spn_16_encryption/src/spn16.dart';
import 'package:spn_16_encryption/src/digest_spn.dart';

void main() {
  test('encode with valid values', () {
    expect(
        Spn16.convert(DigestSpn.fromString(validInput),
                KeySpn.fromString(validKeyword))
            .toString(),
        validOutput);
  });

  test('digest throws format exception', () {
    expect(() => DigestSpn.fromString(invalidInput),
        throwsA(isA<FormatException>()));
  });
}

const validInput = "Hey, this is a plain text.";
const validKeyword = "parolaol";
const validOutput = "Ifx/!wijr#hp!b!smbhm!wd{u-";

const invalidInput = "Selam, türkçe karakter ve emoji kullanıyorum. 😎";

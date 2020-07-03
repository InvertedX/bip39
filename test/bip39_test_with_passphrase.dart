import 'dart:convert';
import 'package:hex/hex.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:bip39/bip39.dart';
import 'package:test/test.dart';

void main() {
  Map<String, dynamic> vectors = json.decode(
      File('./test/vectors_with_passphrase.json')
          .readAsStringSync(encoding: utf8));

  group('Validate seed with passphrase', () {
    int i = 0;
    (vectors['english'] as List<dynamic>).forEach((list) {
      testVector(list, i);
      i++;
    });
  });
}

void testVector(List<dynamic> v, int i) {
  final ventropy = v[0];
  final vmnemonic = v[1];
  final vseedHex = v[2];
  final vmpassphrase = v[3];

  group('for English(${i}), ${ventropy}', () {
    setUp(() {});
    test('mnemoic to entropy', () {
      final String entropy = Bip39(mnemonic: vmnemonic).getEntropy();
      expect(entropy, equals(ventropy));
    });
    test('mnemonic to seed hex', () {
      final seedHex =
          Bip39(mnemonic: vmnemonic).toSeedHEX(passPhrase: vmpassphrase);
      expect(seedHex, equals(vseedHex));
    });
    test('entropy to mnemonic', () {
      final code = Bip39(fromEntropy: ventropy).getMnemonic();
      expect(code, equals(vmnemonic));
    });
    test('generate mnemonic', () {
      RandomBytes randomBytes = (int size) {
        return HEX.decode(ventropy);
      };
      final code =
          Bip39().generateMnemonic(randomBytes: randomBytes).getMnemonic();
      expect(code, equals(vmnemonic),
          reason: 'generateMnemonic returns randomBytes entropy unmodified');
    });
    test('validate mnemonic', () {
      expect(Bip39(mnemonic: vmnemonic).validate(), isTrue,
          reason: 'validateMnemonic returns true');
    });
  });
}

import 'dart:convert';
import 'dart:typed_data';
import 'package:pointycastle/digests/sha512.dart';
import 'package:pointycastle/key_derivators/api.dart' show Pbkdf2Parameters;
import 'package:pointycastle/key_derivators/pbkdf2.dart';
import 'package:pointycastle/macs/hmac.dart';

class PBKDF2 {
  static Uint8List process(
    String mnemonic, {
    passPhrase = "",
    blockLength = 128,
    iterationCount = 2048,
    desiredKeyLength = 64,
  }) {
    String salt = "mnemonic${passPhrase}";
    Uint8List _salt = utf8.encode(salt);
    PBKDF2KeyDerivator _derivator =
        new PBKDF2KeyDerivator(new HMac(new SHA512Digest(), blockLength))
          ..init(new Pbkdf2Parameters(_salt, iterationCount, desiredKeyLength));
    return _derivator.process(new Uint8List.fromList(mnemonic.codeUnits));
  }
}

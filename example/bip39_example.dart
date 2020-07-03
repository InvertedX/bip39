import 'package:bip39/bip39.dart';

main() async {
  /**
   * Generate random mnemonic
   */
  Bip39 randomMnemonic = Bip39().generateMnemonic();
  print("Seed Mnemonic: ${randomMnemonic.getMnemonic()}");
  print("Seed : ${randomMnemonic.toSeed()}");
  print("Seed HEX: ${randomMnemonic.toSeedHEX()}");
  print("Seed Entropy: ${randomMnemonic.getEntropy()}");

  print("\n\n");

  Bip39 provideMnemonic = Bip39(
      mnemonic:
          "club middle wheat river state exile embark excuse syrup teach trap fruit");
  print("Seed for given mnemonic: ${provideMnemonic.toSeed()} ");
  print("Seed HEX for given mnemonic: ${provideMnemonic.toSeedHEX()} ");
  print("Seed HEX for given mnemonic with password: ${provideMnemonic.toSeedHEX(passPhrase: "qwerty")} ");

  print("\n\n");

  /**
   * Validating mnemonic
   */
  print("Validate : ${Bip39.validateMnemonic('club excuse syrup teach trap fruit')}");
}

# BIP39

[![Build Status](https://github.com/InvertedX/bip39/workflows/Dart%20CI/badge.svg)](https://github.com/InvertedX/bip39/actions)

Dart implementation of [Bitcoin BIP39](https://github.com/bitcoin/bips/blob/master/bip-0039.mediawiki): Mnemonic code for generating deterministic keys

Based on [bitcoinjs/bip39](https://github.com/bitcoinjs/bip39)

## Reminder for developers

***Please remember to allow recovery from mnemonic phrases that have invalid checksums (or that you don't have the wordlist)***

When a checksum is invalid, warn the user that the phrase is not something generated by your app, and ask if they would like to use it anyway. This way, your app only needs to hold the wordlists for your supported languages, but you can recover phrases made by other apps in other languages.

However, there should be other checks in place, such as checking to make sure the user is inputting 12 words or more separated by a space.


## Examples
``` dart
// Generate a random mnemonic (uses crypto.randomBytes under the hood), defaults to 128-bits of entropy
    Bip39 randomMnemonic = Bip39().generateMnemonic();
    randomMnemonic.getMnemonic();
    //=> get BIP39 Mnemonic word list
    randomMnemonic.toSeed()
    //=>[121, 234, 49, 122, 169, 92, 108, 194, 93, 235, 146, 128, 182, 183, 214, 124, 113...
    randomMnemonic.toSeedHEX()
    //=> 79ea317aa95c6cc25deb9280b6b7d67c713a9a738c06782652d36acbe01b70b788ff7f2...
    randomMnemonic.getEntropy()
    //=> d12073d0ade186328c4b948b1a8309e4...

Bip39 provideMnemonic = Bip39(mnemonic:"unknown obvious unfold dutch shell state brisk benefit must rubber labor person");

print(provideMnemonic.toSeed())
//=>Uint8List [41, 232, 68, 203, 75, 142, 239, 212, 141, 229, 194, 129, 127....

``` 

```dart
main() {

  Bip39 randomMnemonic = Bip39().generateMnemonic();
  print("Seed Mnemonic: ${randomMnemonic.getMnemonic()}");
  print("Seed : ${randomMnemonic.toSeed()}");
  print("Seed HEX: ${randomMnemonic.toSeedHEX()}");
  print("Seed Entropy: ${randomMnemonic.getEntropy()}");


  Bip39 provideMnemonic = Bip39(
      mnemonic:
          "club middle wheat river state exile embark excuse syrup teach trap fruit");
  print("Seed for given mnemonic: ${provideMnemonic.toSeed()} ");
  print("Seed HEX for given mnemonic: ${provideMnemonic.toSeedHEX()} ");
  print("Seed HEX for given mnemonic with password: ${provideMnemonic.toSeedHEX(passPhrase: "qwerty")} ");
}
```

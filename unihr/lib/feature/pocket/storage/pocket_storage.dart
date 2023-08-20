import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class PocketStorage {

  static const FlutterSecureStorage secureStorage = FlutterSecureStorage();

  static Future<void> setMapData(int? heart,int? scgc,
      int? unicorn, int? pony, int? fastmove, int? doit, int? caring,
      int? centaur, int? csr, int? obesesion, int? outperform,) async {
    await secureStorage.write(key: 'heart', value: heart.toString());
    await secureStorage.write(key: 'scgc', value: scgc.toString());
    await secureStorage.write(key: 'unicorn', value: unicorn.toString());
    await secureStorage.write(key: 'pony', value: pony.toString());
    await secureStorage.write(key: 'fastmove', value: fastmove.toString());
    await secureStorage.write(key: 'doit', value: doit.toString());
    await secureStorage.write(key: 'caring', value: caring.toString());
    await secureStorage.write(key: 'centaur', value: centaur.toString());
    await secureStorage.write(key: 'csr', value: csr.toString());
    await secureStorage.write(key: 'obesesion', value: obesesion.toString());
    await secureStorage.write(key: 'outperform', value: outperform.toString());
  }
}
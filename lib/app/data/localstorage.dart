import 'package:get_storage/get_storage.dart';
import 'package:mekanik/app/data/publik.dart';

class LocalStorages {
  static GetStorage boxToken = GetStorage('token-mekanik');

  static Future<bool> hasToken() async {
    String token = await getToken;
    return token.isNotEmpty;
  }

  static Future<void> setToken(String token) async {
    await boxToken.write('token', token);
    Publics.controller.getToken.value = LocalStorages.getToken;
    return;
  }

  static String get getToken => boxToken.listenable.value['token'] ?? '';

  static Future<void> get deleteToken async {
    await boxToken.remove('token');
    Publics.controller.getToken.value = LocalStorages.getToken;
  }
}

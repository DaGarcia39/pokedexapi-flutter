import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserSecureStorage {
  static final _storage = FlutterSecureStorage();

  static const _keyUserEmail = 'userEmail';

  static Future setUserEmail(String userEmail) async => await _storage.write(
        key: _keyUserEmail,
        value: userEmail,
      );

  static Future<String> getUserEmail() async =>
      await _storage.read(key: _keyUserEmail);
}

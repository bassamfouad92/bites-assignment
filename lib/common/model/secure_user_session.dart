import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class UserSession {
  Future<void> saveToken(String token);
  Future<String?> getToken();
  Future<void> deleteToken();
  Future<bool> isUserLoggedIn();
}

class SecureUserSession implements UserSession {
  static const String authTokenKey = 'auth_token';
  final FlutterSecureStorage _storage = FlutterSecureStorage();

  SecureUserSession._();
  static final SecureUserSession _instance = SecureUserSession._();

  factory SecureUserSession() {
    return _instance;
  }

  @override
  Future<void> saveToken(String token) async {
    await _storage.write(key: authTokenKey, value: token);
  }

  @override
  Future<String?> getToken() async {
    return await _storage.read(key: authTokenKey);
  }

  @override
  Future<void> deleteToken() async {
    await _storage.delete(key: authTokenKey);
  }

  @override
  Future<bool> isUserLoggedIn() async {
    final token = await getToken();
    return token != null;
  }
}

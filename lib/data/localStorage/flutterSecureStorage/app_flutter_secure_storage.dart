import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@injectable
class AppFlutterSecureStorage {
  final storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(
        encryptedSharedPreferences: true,
      ),
  );

  Future setLoginToken(String token) async {
    await storage.write(
      key: 'loginToken',
      value: token,
    );
  }

  Future readLoginToken() async {
    final loginToken = await storage.read(key: 'loginToken', );
    return loginToken;
  }
}

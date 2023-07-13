
import 'package:injectable/injectable.dart';
import 'package:native_shared_preferences/native_shared_preferences.dart';

@injectable
class AppSharedPreferences {
  Future cacheUserTokenAfterSuccessfulAuth(String userToken) async {
    final prefs = await NativeSharedPreferences.getInstance();
    await prefs.setString('userAuthToken', userToken);
  }

  Future readUserAuthToken() async {
    final prefs = await NativeSharedPreferences.getInstance();
    var userAuthToken = prefs.getString('userAuthToken');
    return userAuthToken;
  }
}

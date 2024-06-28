import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static late final SharedPreferences _pref;

  static Future<SharedPreferences> init() async {
    _pref = await SharedPreferences.getInstance();
    return _pref;
  }

  // Save data
  Future<void> setAccessToken(String token) async {
    await _pref.setString('access_token', token);
  }

  Future<void> setRefreshToken(String token) async {
    await _pref.setString('refresh_token', token);
  }

  // Retrieve data
  String? getAccessToken() {
    return _pref.getString('access_token');
  }

  String? getRefreshToken() {
    return _pref.getString('refresh_token');
  }

  // Clear data
  Future<void> clearTokens() async {
    await _pref.remove('access_token');
    await _pref.remove('refresh_token');
  }
}

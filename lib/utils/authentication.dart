import 'package:shared_preferences/shared_preferences.dart';

class Authentication {
  static String _tokenKey = "token";
  static String _refreshTokenKey = "refreshToken";

  static Future<bool> authenticated() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey) != null &&
        prefs.getString(_refreshTokenKey) != null;
  }

  static void logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(_tokenKey);
    prefs.remove(_refreshTokenKey);
  }

  static void saveToken(String token, String refreshToken) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(_tokenKey, token);
    prefs.setString(_refreshTokenKey, refreshToken);
  }

  static Future<String> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  static Future<String> getRefreshToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_refreshTokenKey);
  }
}

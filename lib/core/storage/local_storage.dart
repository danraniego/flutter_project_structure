import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  /// Check If Token Exist
  static Future<bool?> checkToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey("token") ? true : false;
  }

  /// Get User Token
  static getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("token");
  }

  /// Get User Token
  static setToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("token", token);
  }

  /// Remove User Token
  static removeToken() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("token");
  }

  /// Store User Details
  static setUserDetails(user) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString("user", user);
  }

  /// Get User Details
  static getUserDetails() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("user");
  }

  /// Remove User Details
  static removeUserDetails() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("user");
  }

  /// Set User Credentials
  static setUserCredentials(String creds) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("creds", creds);
  }

  /// Get User Credentials
  static getCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("creds");
  }
}

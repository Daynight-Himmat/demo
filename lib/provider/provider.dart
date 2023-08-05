import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Preference extends ChangeNotifier {

  static const isLogIn = "isLoggedIn";
  static const email = 'email';
  static const password = 'password';
  static const username = 'username';



  static Preference? _preference;
  static Future<SharedPreferences>? prefs = SharedPreferences.getInstance();

  static init() async {
    SharedPreferences? sharedPreferences = await prefs;
    return sharedPreferences;
  }

  static Future<Preference?> getInstance() async {
    _preference ??= Preference();
    prefs;
    return _preference;
  }

  void setIsLoggedIn(bool isLoggedIn) async {
    SharedPreferences? preferences = await prefs;
    preferences
        ?.setBool(Preference.isLogIn, isLoggedIn)
        .then((bool success) => isLoggedIn);
  }

  Future<bool?> isLoggedIn() async {
    SharedPreferences? preferences = await prefs;
    return preferences?.getBool(Preference.isLogIn);
  }

  void setEmail(String email) async {
    SharedPreferences? preferences = await prefs;
    preferences
        ?.setString(Preference.email, email)
        .then((bool success) {
      if (success == true) {
        if (kDebugMode) {
          print("success: $success");
        }

      } else {
        if (kDebugMode) {
          print("success: $success");
        }
      }
      return email;
    });
  }

  Future<String?> getEmail() async {
    SharedPreferences? preferences = await prefs;
    return preferences?.getString(Preference.email);
  }

  void setUsername(String username) async {
    SharedPreferences? preferences = await prefs;
    preferences
        ?.setString(Preference.username, username)
        .then((bool success) {
      if (success == true) {
        print("success: $success");

      } else {
        print("success: $success");
      }
      return username;
    });
  }

  Future<String?> getUsername() async {
    SharedPreferences? preferences = await prefs;
    return preferences?.getString(Preference.username);
  }

  void setPassword(String password) async {
    SharedPreferences? preferences = await prefs;
    preferences
        ?.setString(Preference.password, password)
        .then((bool success) {
      if (success == true) {
        print("success: $success");

      } else {
        print("success: $success");
      }
      return password;
    });
  }

  Future<String?> getPassword() async {
    SharedPreferences? preferences = await prefs;
    return preferences?.getString(Preference.password);
  }

  void clearPref() async {
    final prefs = await SharedPreferences.getInstance();
    // ignore: avoid_print
    prefs.clear().then((bool success) {
      if (success == true) {
        print("success = $success");
      } else {
        print("success = $success");
      }
    });
  }
}
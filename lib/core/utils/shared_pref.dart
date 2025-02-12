import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum MySharedKeys {
  accessToken,
  userName,
  userEmail,
  userPhone,
  userType,
}

abstract class MySharedPrefInterface {
  Future<SharedPreferences> initSP();

  void putString({required MySharedKeys key, required String? value});

  String getString({required MySharedKeys key});

  Future<bool>? clearShared();

  SharedPreferences get preferences;

  bool isHaveToken();
}

class MySharedPref extends MySharedPrefInterface {
  late SharedPreferences _preferences;

  @override
  bool isHaveToken() {
    final token = _preferences.getString(MySharedKeys.accessToken.name);
    return token != null && token != '';
  }

  @override
  Future<SharedPreferences> initSP() async {
    if (kDebugMode) {
      print('\x1B[32m$initSP\x1B[0m');
    }
    return _preferences = await SharedPreferences.getInstance();
  }

  @override
  SharedPreferences get preferences {
    return _preferences;
  }

  @override
  void putString({
    required MySharedKeys key,
    required String? value,
  }) async {
    await _preferences.setString(key.name, value ?? "");
  }

  @override
  String getString({required MySharedKeys key}) {
    return _preferences.getString(key.name) ?? "";
  }

  @override
  Future<bool>? clearShared() {
    return _preferences.clear();
  }
}

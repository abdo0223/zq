import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  //first time
  static bool isOnBoarding = true;
  //login or not
  static bool isLogin = false;

  static Future<bool> setSaved(
      {required dynamic value, required String key,}) async {
    if (value is String) {
      return await sharedPreferences!.setString(key, value);
    }
    if (value is bool) {
      return await sharedPreferences!.setBool(key, value);
    }
    if (value is int) {
      return await sharedPreferences!.setInt(key, value);
    }

    return await sharedPreferences!.setDouble(key, value);
  }

  static dynamic getSaved({required String key}) {
    return sharedPreferences!.get(key);
  }

  static Future<dynamic> deleteSaved({required String key})async {
    return await sharedPreferences!.remove(key);
  }


}
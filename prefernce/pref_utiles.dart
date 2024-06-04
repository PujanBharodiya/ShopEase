import 'package:shared_preferences/shared_preferences.dart';

class pref_utiles{

  static late SharedPreferences _instance;
  static const String KEY_IS_LOGIN = 'isLogin';
  static const String KEY_ONBOARDING = 'isVisited';

  static Future<SharedPreferences> init() async {
    _instance = await SharedPreferences.getInstance();
    return _instance;
  }
  static Future<bool> updateLoginStatus(bool status ) async {
    return await _instance.setBool(KEY_IS_LOGIN ,status);
  }
  static bool getLoginStatus() {
    return _instance.getBool(KEY_IS_LOGIN) ?? false;
  }
  static Future<bool> logout()  {
    return _instance.remove(KEY_IS_LOGIN);
  }
  static Future<bool> updateOnboardingScreenStatus(bool status) async {
    return await _instance.setBool(KEY_ONBOARDING,status);
  }
  static getOnboardingScreenStatus()  {
    return  _instance.getBool(KEY_ONBOARDING) ?? false;
  }
}
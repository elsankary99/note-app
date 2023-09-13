import 'package:note_app/core/enum/app_language_enum.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  static late SharedPreferences sharedPreferences;
  static Future<void> initial() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<void> setLangData(AppLanguage langCode) async {
    sharedPreferences.setString("lang", langCode.name);
  }

  static AppLanguage? getLangDate() {
    String? langCode = sharedPreferences.getString("lang");
    if (langCode != null) {
      for (AppLanguage language in AppLanguage.values) {
        if (language.name == langCode) {
          return language;
        }
      }
    }
    return null;
  }

  //!////!
  static Future<void> setThemeDate(bool isDark) async {
    await sharedPreferences.setBool("isDark", isDark);
  }

  static bool? getThemeData() {
    return sharedPreferences.getBool("isDark");
  }
}

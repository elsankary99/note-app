import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_app/core/enum/app_language_enum.dart';
import 'package:note_app/data/service/database/shared_prefrance.dart';

part 'language_state.dart';

final languageProvider = StateNotifierProvider<LanguageProvider, LanguageState>(
    (ref) => LanguageProvider());

class LanguageProvider extends StateNotifier<LanguageState> {
  LanguageProvider() : super(LanguageInitial());
  AppLanguage? appLanguage;

  init() {
    appLanguage = SharedPreferenceHelper.getLangDate();

    state = LanguageChanged();
  }

  Future<void> changeLang(AppLanguage langCode) async {
    state = LanguageLoading();
    try {
      await SharedPreferenceHelper.setLangData(langCode);
      appLanguage = langCode;
      state = LanguageChanged();
    } catch (error) {
      state = const LanguageError("error while changing app language");
    }
  }
}

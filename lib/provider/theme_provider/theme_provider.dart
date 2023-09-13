import 'package:note_app/data/service/database/shared_prefrance.dart';
import 'package:riverpod/riverpod.dart';
part 'theme_state.dart';

final themeProvider =
    StateNotifierProvider<ThemeProvider, ThemeState>((ref) => ThemeProvider());

class ThemeProvider extends StateNotifier<ThemeState> {
  ThemeProvider() : super(ThemeInitial());
  bool? isDark;
  //? init
  Future<void> init() async {
    isDark = SharedPreferenceHelper.getThemeData();
  }

//?change Theme
  changeTheme(bool isDark) {
    state = ThemeLoading();
    try {
      SharedPreferenceHelper.setThemeDate(isDark);
      this.isDark = isDark;
      state = ThemeChanged();
    } catch (e) {
      state = const ThemeError("there is error when theme changed");
    }
  }
}

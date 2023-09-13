import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:note_app/core/constant/app_color.dart';
import 'package:note_app/core/enum/app_language_enum.dart';
import 'package:note_app/core/localization/app_localizations.dart';
import 'package:note_app/core/router/app_router.dart';
import 'package:note_app/provider/language_provider/language_provider.dart';
import 'package:note_app/provider/theme_provider/theme_provider.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(languageProvider.select((state) => state is LanguageChanged));
    ref.watch(themeProvider.select((state) => state is ThemeChanged));

    final AppLanguage? appLanguage =
        ref.watch(languageProvider.notifier).appLanguage;
    final bool isDark = ref.watch(themeProvider.notifier).isDark ?? true;
    return MaterialApp.router(
      // locale: DevicePreview.locale(context),
      locale: (appLanguage == null) ? null : Locale(appLanguage.name),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      localeResolutionCallback: localeResolutionCallback,
      theme: isDark
          ? ThemeData.dark().copyWith(
              scaffoldBackgroundColor: AppColor.backGroundColor,
              appBarTheme:
                  const AppBarTheme(backgroundColor: AppColor.backGroundColor))
          : ThemeData.light(),
      routerConfig: router.config(),
    );
  }

  Locale localeResolutionCallback(
      Locale? locale, Iterable<Locale> supportedLocals) {
    if (locale == null) {
      return supportedLocals.last;
    }
    for (var supportedLocal in supportedLocals) {
      if (locale.languageCode == supportedLocal.languageCode) {
        return supportedLocal;
      }
    }
    return supportedLocals.last;
  }
}

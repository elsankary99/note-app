import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:note_app/core/constant/app_color.dart';
import 'package:note_app/core/enum/app_language_enum.dart';
import 'package:note_app/core/extension/localization_extention.dart';
import 'package:note_app/core/extension/media_query.dart';
import 'package:note_app/provider/language_provider/language_provider.dart';
import 'package:note_app/provider/theme_provider/theme_provider.dart';
import 'package:note_app/screen/widget/home/custom_icon.dart';

@RoutePage()
class SettingPage extends ConsumerWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final active = ref.watch(themeProvider.notifier).isDark;
    ref.watch(themeProvider);

    final data = ref.watch(languageProvider.notifier).appLanguage;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(children: [
            Directionality(
              textDirection: TextDirection.rtl,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        context.tr.setting,
                        style: const TextStyle(
                            fontSize: 26, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  CustomIcon(
                      onTap: () => context.router.pop(),
                      icon: FontAwesomeIcons.angleLeft),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Card(
              child: ListTile(
                title: Text(
                  context.tr.change_anguage,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing: const Icon(
                  FontAwesomeIcons.globe,
                  color: AppColor.orange,
                ),
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: 200.0,
                        color: Theme.of(context).scaffoldBackgroundColor,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: context.width * 0.4,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColor.orange,
                                      textStyle: const TextStyle(fontSize: 18)),
                                  onPressed: () {
                                    if (data != AppLanguage.ar) {
                                      ref
                                          .read(languageProvider.notifier)
                                          .changeLang(AppLanguage.ar);

                                      Navigator.of(context).pop();
                                    }
                                  },
                                  child: Text(context.tr.arabic),
                                ),
                              ),
                              const SizedBox(height: 16.0),
                              SizedBox(
                                width: context.width * 0.4,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColor.orange,
                                      textStyle: const TextStyle(fontSize: 18)),
                                  onPressed: () {
                                    if (data != AppLanguage.en) {
                                      ref
                                          .read(languageProvider.notifier)
                                          .changeLang(AppLanguage.en);
                                      Navigator.of(context).pop();
                                    }
                                  },
                                  child: Text(context.tr.english),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            Card(
              child: ListTile(
                trailing: const Icon(
                  FontAwesomeIcons.solidMoon,
                  color: AppColor.orange,
                ),
                title: Text(
                  context.tr.dark_theme,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: Switch(
                  activeColor: AppColor.orange,
                  inactiveThumbColor: AppColor.grey,
                  activeTrackColor: AppColor.orange.withOpacity(0.5),
                  value: (active == null) ? true : active,
                  onChanged: (value) {
                    ref.read(themeProvider.notifier).changeTheme(value);
                  },
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}

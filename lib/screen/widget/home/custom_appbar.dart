import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:note_app/core/localization/app_localizations.dart';
import 'package:note_app/screen/view/setting/setting_page.dart';
import 'package:note_app/screen/widget/home/custom_icon.dart';

class CustomAppBar extends StatelessWidget {
  final void Function()? onTap;
  const CustomAppBar({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppLocalizations.of(context)!.notes,
          style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
        CustomIcon(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const SettingPage(),
              ));
            },
            icon: FontAwesomeIcons.gear),
      ],
    );
  }
}

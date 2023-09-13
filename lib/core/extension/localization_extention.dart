import 'package:flutter/material.dart';
import 'package:note_app/core/localization/app_localizations.dart';

extension LocalizationExtension on BuildContext {
  AppLocalizations get tr {
    return AppLocalizations.of(this)!;
  }
}

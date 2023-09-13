import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_app/app.dart';
import 'package:note_app/data/service/database/shared_prefrance.dart';
import 'package:note_app/provider/language_provider/language_provider.dart';
import 'package:note_app/provider/theme_provider/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferenceHelper.initial();
  final container = ProviderContainer();
  container.read(languageProvider.notifier).init();
  container.read(themeProvider.notifier).init();
  runApp(UncontrolledProviderScope(container: container, child: const MyApp()));
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:note_app/data/model/note_model.dart';
import 'package:note_app/screen/view/add_note/add_note_page.dart';
import 'package:note_app/screen/view/edit_note/edit_note_page.dart';
import 'package:note_app/screen/view/home/home_page.dart';
import 'package:note_app/screen/view/note_details/note_details_page.dart';
import 'package:note_app/screen/view/splash/splash_page.dart';

part 'app_router.gr.dart';

final router = AppRouter();

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: HomeRoute.page),
        // AutoRoute(page: SettingRoute.page),
        AutoRoute(page: AddNoteRoute.page),
        AutoRoute(page: EditNoteRoute.page),
        AutoRoute(page: NoteDetailsRoute.page),
      ];
}

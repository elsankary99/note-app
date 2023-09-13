import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_app/core/constant/app_color.dart';
import 'package:note_app/core/extension/media_query.dart';
import 'package:note_app/core/router/app_router.dart';
import 'package:note_app/provider/notes_provider/notes_provider.dart';

@RoutePage()
class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    ref.read(notesProvider.notifier).getAllNote();
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
      () => context.router.push(const HomeRoute()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration:
          BoxDecoration(color: Theme.of(context).scaffoldBackgroundColor),
      child: Center(
          child: Image.asset(
        "asset/images/icon.jpg",
        color: AppColor.orange,
        height: context.height * 0.23,
      )),
    ));
  }
}

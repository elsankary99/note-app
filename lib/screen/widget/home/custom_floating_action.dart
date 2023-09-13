import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:note_app/core/constant/app_color.dart';
import 'package:note_app/core/router/app_router.dart';

class CustomFloatingAction extends StatelessWidget {
  const CustomFloatingAction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        context.router.push(const AddNoteRoute());
      },
      backgroundColor: AppColor.orange,
      child: const Icon(
        FontAwesomeIcons.plus,
        size: 30,
        color: Colors.white,
      ),
    );
  }
}

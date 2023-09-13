import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:note_app/core/constant/app_color.dart';
import 'package:note_app/core/router/app_router.dart';
import 'package:note_app/data/model/note_model.dart';
import 'package:note_app/screen/widget/home/custom_icon.dart';

class NoteDetailsAppBar extends StatelessWidget {
  final NoteModel note;

  const NoteDetailsAppBar({
    super.key,
    required this.note,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomIcon(
              onTap: () => context.router.pop(),
              icon: FontAwesomeIcons.angleLeft),
          SizedBox(
            width: 100,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                      radius: 5, backgroundColor: Color(note.noteColor!)),
                  Text(note.noteType!),
                  const Icon(
                    FontAwesomeIcons.angleDown,
                    color: AppColor.grey,
                    size: 18,
                  )
                ],
              ),
            ),
          ),
          CustomIcon(
              onTap: () => context.router.push(EditNoteRoute(note: note)),
              icon: FontAwesomeIcons.penToSquare),
        ],
      ),
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:note_app/core/constant/app_color.dart';
import 'package:note_app/core/extension/media_query.dart';
import 'package:note_app/core/router/app_router.dart';
import 'package:note_app/data/model/note_model.dart';

class NoteCard extends StatelessWidget {
  final NoteModel note;
  const NoteCard({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.router.push(NoteDetailsRoute(note: note)),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        height: context.height * 0.135,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Color(note.noteColor!), width: 3),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              note.title!,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              note.subTitle!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Text(
                  DateFormat("d MMM, yyy",
                          Localizations.localeOf(context).languageCode)
                      .format(DateTime.parse(note.createdTime!)),
                  style: const TextStyle(
                    fontSize: 15,
                    color: AppColor.grey,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: CircleAvatar(
                      radius: 4, backgroundColor: Color(note.noteColor!)),
                ),
                Text(
                  note.noteType!,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

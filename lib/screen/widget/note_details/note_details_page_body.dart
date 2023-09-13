import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:note_app/core/constant/app_color.dart';
import 'package:note_app/data/model/note_model.dart';
import 'package:note_app/provider/notes_provider/notes_provider.dart';
import 'package:note_app/screen/widget/note_details/note_details_appbar.dart';

class NoteDetailsPageBody extends ConsumerWidget {
  final NoteModel note;

  const NoteDetailsPageBody({super.key, required this.note});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.red,
        onPressed: () {
          ref.read(notesProvider.notifier).deleteNote(note);
          ref.read(notesProvider.notifier).getAllNote();
          context.router.pop();
        },
        child: const Icon(
          FontAwesomeIcons.trash,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NoteDetailsAppBar(note: note),
            const Divider(color: AppColor.lightGrey, thickness: 0.7),
            const SizedBox(height: 20),
            Text(
              note.title!,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 20),
              child: Text(
                DateFormat("d MMM. yyy",
                        Localizations.localeOf(context).languageCode)
                    .format(DateTime.parse(note.createdTime!)),
                style: const TextStyle(
                  fontSize: 18,
                  color: AppColor.grey,
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Text(
                  note.subTitle!,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:note_app/data/model/note_model.dart';
import 'package:note_app/screen/widget/edit_note/edit_note_page_body.dart';

@RoutePage()
class EditNotePage extends StatelessWidget {
  final NoteModel note;

  const EditNotePage({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return EditNotePageBody(note: note);
  }
}

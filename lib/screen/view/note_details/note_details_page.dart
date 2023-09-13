import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:note_app/data/model/note_model.dart';
import 'package:note_app/screen/widget/note_details/note_details_page_body.dart';

@RoutePage()
class NoteDetailsPage extends StatelessWidget {
  final NoteModel note;

  const NoteDetailsPage({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return NoteDetailsPageBody(note: note);
  }
}

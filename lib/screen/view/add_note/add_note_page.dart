import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:note_app/screen/widget/add_note/add_note_page_body.dart';

@RoutePage()
class AddNotePage extends StatelessWidget {
  const AddNotePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AddNotePageBody();
  }
}

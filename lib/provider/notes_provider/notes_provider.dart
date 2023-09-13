import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_app/data/model/note_model.dart';
import 'package:note_app/data/repository/sql_repo/sql_database_helper.dart';
part 'notes_state.dart';

final notesProvider =
    StateNotifierProvider<NotesProvider, NotesState>((ref) => NotesProvider());

class NotesProvider extends StateNotifier<NotesState> {
  DatabaseHelper databaseHelper = DatabaseHelper();

  NotesProvider() : super(NotesInitial());
  Future<void> getAllNote() async {
    final data = await databaseHelper.getAllNotes();
    log("========NoteFetched==========");

    state = NoteFetched(data);
  }

  Future<void> addNewNote(NoteModel noteModel) async {
    await databaseHelper.addNewNote(noteModel);
    log("========NoteAdded==========");
  }

  Future<void> updateNote(NoteModel noteModel) async {
    await databaseHelper.updateNote(noteModel);
    log("========updateNote==========");
  }

  Future<void> deleteNote(NoteModel noteModel) async {
    await databaseHelper.deleteNote(noteModel);
    log("========deleteNote==========");
  }
}

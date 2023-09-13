part of 'notes_provider.dart';

abstract class NotesState {
  const NotesState();
}

class NotesInitial extends NotesState {}

class NoteFetched extends NotesState {
  List<NoteModel> notesList;

  NoteFetched(this.notesList);
}

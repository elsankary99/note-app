import 'dart:developer';

import 'package:note_app/data/model/note_model.dart';
import 'package:note_app/data/service/database/sql_database.dart';

class DatabaseHelper extends SqlFLiteDatabase {
  Future<List<NoteModel>> getAllNotes() async {
    List<NoteModel> notesList = [];
    String sql = "SELECT * FROM NOTE";
    List<dynamic> data = await readData(sql);
    for (var note in data) {
      notesList.add(NoteModel.fromJson(note));
    }
    return notesList;
  }

  Future<int> addNewNote(NoteModel noteModel) async {
    String sql = '''
     INSERT INTO NOTE (title, subTitle, createdTime, noteType, noteColor)
      VALUES ('${noteModel.title}', '${noteModel.subTitle}', '${noteModel.createdTime}', '${noteModel.noteType}', ${noteModel.noteColor});
                 ''';
    int data = await createData(sql);
    log("==Added==$data=====");

    return data;
  }

  Future<int> updateNote(NoteModel noteModel) async {
    String sql = '''
     UPDATE NOTE SET 
     title = '${noteModel.title}' ,
     subTitle = '${noteModel.subTitle}',
     createdTime='${noteModel.createdTime}', 
     noteType='${noteModel.noteType}',
     noteColor = ${noteModel.noteColor}
     WHERE
     id = ${noteModel.id}
                 ''';
    int data = await updateData(sql);
    log("==Update==$data=====");

    return data;
  }

  Future<int> deleteNote(NoteModel noteModel) async {
    String sql = '''
     DELETE FROM NOTE 
     WHERE
     id = ${noteModel.id}
                 ''';
    int data = await deleteData(sql);
    log("==Delete==$data=====");

    return data;
  }
}

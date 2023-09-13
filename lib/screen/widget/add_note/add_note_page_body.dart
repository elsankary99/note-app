import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_app/core/constant/app_color.dart';
import 'package:note_app/core/enum/note_type_enum.dart';
import 'package:note_app/core/extension/localization_extention.dart';
import 'package:note_app/core/router/app_router.dart';
import 'package:note_app/data/model/note_model.dart';
import 'package:note_app/data/repository/sql_repo/sql_database_helper.dart';
import 'package:note_app/provider/notes_provider/notes_provider.dart';
import 'package:note_app/screen/widget/add_note/add_note_appbar.dart';

class AddNotePageBody extends StatefulWidget {
  const AddNotePageBody({super.key});

  @override
  State<AddNotePageBody> createState() => _AddNotePageBodyState();
}

class _AddNotePageBodyState extends State<AddNotePageBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  DatabaseHelper databaseHelper = DatabaseHelper();
  NoteType _selectedType = NoteType.values.first;
  String? title;
  String? subTitle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Consumer(
                  builder: (context, ref, child) {
                    return AddNoteAppBar(
                      selectedType: _selectedType,
                      onChanged: (value) {
                        setState(() {
                          _selectedType = value!;
                        });
                      },
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();

                          await ref
                              .read(notesProvider.notifier)
                              .addNewNote(NoteModel(
                                title: title,
                                subTitle: subTitle,
                                createdTime: DateTime.now().toIso8601String(),
                                noteColor: _selectedType.color.value,
                                noteType: _selectedType.name,
                              ));
                          // await ref.read(notesProvider.notifier).getAllNote();
                          // await databaseHelper.addNewNote(NoteModel(
                          //   title: title,
                          //   subTitle: subTitle,
                          //   createdTime: DateTime.now().toIso8601String(),
                          //   noteColor: _selectedType.color.value,
                          //   noteType: _selectedType.name,
                          // ));
                          ref.read(notesProvider.notifier).getAllNote();

                          router.pop();
                        }
                      },
                    );
                  },
                ),
                const Divider(color: AppColor.lightGrey, thickness: 0.7),
                const SizedBox(height: 15),
                TextFormField(
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return context.tr.please_enter_some_text;
                    }
                    return null;
                  },
                  onSaved: (value) => title = value,
                  maxLength: 25,
                  cursorColor: AppColor.lightGrey,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: context.tr.enter_note_title,
                      hintStyle: const TextStyle(
                          color: AppColor.lightGrey, fontSize: 16)),
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.trim().isEmpty) {
                      return context.tr.please_enter_some_text;
                    }
                    return null;
                  },
                  onSaved: (value) => subTitle = value,
                  maxLines: null,
                  cursorColor: AppColor.lightGrey,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: context.tr.enter_note_substitle,
                      hintStyle: const TextStyle(
                          color: AppColor.lightGrey, fontSize: 16)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


          //       log('''
          // $title 
          // $subTitle
          // ${DateTime.now().toIso8601String()}
          // ${_selectedType.color.value}
          // ${_selectedType.name}
          // ''');
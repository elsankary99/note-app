import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_app/core/constant/app_color.dart';
import 'package:note_app/data/model/note_model.dart';
import 'package:note_app/data/repository/sql_repo/sql_database_helper.dart';
import 'package:note_app/provider/notes_provider/notes_provider.dart';
import 'package:note_app/screen/widget/home/custom_appbar.dart';
import 'package:note_app/screen/widget/home/custom_floating_action.dart';
import 'package:note_app/screen/widget/home/note_card.dart';

class HomePageBody extends ConsumerStatefulWidget {
  const HomePageBody({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends ConsumerState<HomePageBody> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<NoteModel> notesList = [];

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(notesProvider);

    if (state is NoteFetched) {
      notesList = state.notesList;
    }
    return Scaffold(
        floatingActionButton: const Directionality(
            textDirection: TextDirection.rtl, child: CustomFloatingAction()),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(children: [
                CustomAppBar(
                  onTap: () {
                    setState(() {});
                  },
                ),
                const Divider(color: AppColor.lightGrey, thickness: 0.7),
                // const SizedBox(height: 20),
                Expanded(
                    child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: notesList.length,
                  itemBuilder: (context, index) {
                    return NoteCard(note: notesList[index]);
                  },
                )),
              ])),
        ));
  }
}

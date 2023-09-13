import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:note_app/core/enum/note_type_enum.dart';
import 'package:note_app/screen/widget/add_note/custom_dropdown_button.dart';
import 'package:note_app/screen/widget/home/custom_icon.dart';

class EditNoteAppBar extends StatelessWidget {
  final NoteType selectedType;
  final void Function(NoteType?) onChanged;
  final void Function() onTap;

  const EditNoteAppBar({
    super.key,
    required this.selectedType,
    required this.onChanged,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomIcon(
              onTap: () => context.router.pop(),
              icon: FontAwesomeIcons.angleLeft),
          CustomDropdownButton(
            onChanged: onChanged,
            selectedType: selectedType,
          ),
          CustomIcon(onTap: onTap, icon: FontAwesomeIcons.solidFloppyDisk),
        ],
      ),
    );
  }
}

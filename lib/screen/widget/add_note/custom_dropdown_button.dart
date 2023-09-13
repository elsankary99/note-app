import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:note_app/core/enum/note_type_enum.dart';

class CustomDropdownButton extends StatelessWidget {
  final NoteType selectedType;
  final void Function(NoteType?) onChanged;
  const CustomDropdownButton(
      {super.key, required this.selectedType, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Center(
        child: DropdownButton<NoteType>(
          iconSize: 18,
          underline: const SizedBox(),
          icon: const Icon(
            FontAwesomeIcons.angleDown,
          ),
          dropdownColor: Theme.of(context).scaffoldBackgroundColor,
          value: selectedType,
          onChanged: onChanged,
          items: NoteType.values.map((NoteType noteType) {
            return DropdownMenuItem<NoteType>(
              value: noteType,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 5,
                      backgroundColor: noteType.color,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(noteType.name),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

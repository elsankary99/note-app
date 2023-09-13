// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:note_app/core/constant/app_color.dart';

enum NoteType {
  Personal("Personal", AppColor.orange),
  Work("Work", AppColor.purple),
  Study("Study", AppColor.blueAqua),
  Family("Family", AppColor.red);

  const NoteType(this.name, this.color);
  final String name;
  final Color color;
}

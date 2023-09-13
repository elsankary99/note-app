class NoteModel {
  int? id;
  String? title;
  String? subTitle;
  String? createdTime;
  String? noteType;
  int? noteColor;

  NoteModel({
    this.id,
    this.title,
    this.subTitle,
    this.createdTime,
    this.noteType,
    this.noteColor,
  });

  factory NoteModel.fromJson(Map<String, dynamic> json) {
    return NoteModel(
      id: json['id'],
      title: json['title'],
      subTitle: json['subTitle'],
      createdTime: json['createdTime'],
      noteType: json['noteType'],
      noteColor: json['noteColor'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'subTitle': subTitle,
      'createdTime': createdTime,
      'noteType': noteType,
      'noteColor': noteColor,
    };
  }
}

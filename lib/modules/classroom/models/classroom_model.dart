class ClassroomModel {
  List<Classroom> classrooms;

  ClassroomModel({
    required this.classrooms,
  });

  factory ClassroomModel.fromJson(Map<String, dynamic> json) => ClassroomModel(
        classrooms: List<Classroom>.from(
            json["classrooms"].map((x) => Classroom.fromJson(x))),
      );
}

class Classroom {
  int id;
  String layout;
  String name;
  int size;
  String subject;

  Classroom({
    required this.id,
    required this.layout,
    required this.name,
    required this.size,
    required this.subject,
  });

  factory Classroom.fromJson(Map<String, dynamic> json) => Classroom(
        id: json["id"],
        layout: json["layout"],
        name: json["name"],
        size: json["size"] ?? 0,
        subject: json.containsKey('subject') ? json["subject"].toString() : '',
      );
}

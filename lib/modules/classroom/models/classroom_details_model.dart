// To parse this JSON data, do
//
//     final classroomDetailsModel = classroomDetailsModelFromJson(jsonString);

import 'dart:convert';

ClassroomDetailsModel classroomDetailsModelFromJson(String str) =>
    ClassroomDetailsModel.fromJson(json.decode(str));

String classroomDetailsModelToJson(ClassroomDetailsModel data) =>
    json.encode(data.toJson());

class ClassroomDetailsModel {
  int id;
  String layout;
  String name;
  int size;
  String subject;

  ClassroomDetailsModel({
    required this.id,
    required this.layout,
    required this.name,
    required this.size,
    required this.subject,
  });

  factory ClassroomDetailsModel.fromJson(Map<String, dynamic> json) =>
      ClassroomDetailsModel(
        id: json["id"],
        layout: json["layout"],
        name: json["name"],
        size: json["size"],
        subject: json["subject"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "layout": layout,
        "name": name,
        "size": size,
        "subject": subject,
      };
}

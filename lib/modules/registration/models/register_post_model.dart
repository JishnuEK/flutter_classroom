class RegistrationPostModel {
  RegistrationPost? registration;
  String error;

  RegistrationPostModel({
    required this.registration,
    required this.error,
  });

  factory RegistrationPostModel.fromJson(Map<String, dynamic> json) =>
      RegistrationPostModel(
        registration: json.containsKey('registration') == false
            ? null
            : RegistrationPost.fromJson(json["registration"]),
        error: json.containsKey('error') == false ? '' : json["error"],
      );
}

class RegistrationPost {
  int id;
  int student;
  int subject;

  RegistrationPost({
    required this.id,
    required this.student,
    required this.subject,
  });

  factory RegistrationPost.fromJson(Map<String, dynamic> json) =>
      RegistrationPost(
        id: json["id"],
        student: json["student"],
        subject: json["subject"],
      );
}

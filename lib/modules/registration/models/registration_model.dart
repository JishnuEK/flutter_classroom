class RegistrationModel {
  List<Registration> registrations;

  RegistrationModel({
    required this.registrations,
  });

  factory RegistrationModel.fromJson(Map<String, dynamic> json) =>
      RegistrationModel(
        registrations: List<Registration>.from(
            json["registrations"].map((x) => Registration.fromJson(x))),
      );
}

class Registration {
  int id;
  int student;
  int subject;

  Registration({
    required this.id,
    required this.student,
    required this.subject,
  });

  factory Registration.fromJson(Map<String, dynamic> json) => Registration(
        id: json["id"],
        student: json["student"],
        subject: json["subject"],
      );
}

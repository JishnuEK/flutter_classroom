class RegistrationDeleteModel {
  String message;

  RegistrationDeleteModel({
    required this.message,
  });

  factory RegistrationDeleteModel.fromJson(Map<String, dynamic> json) =>
      RegistrationDeleteModel(
        message: json["message"] ?? "",
      );
}

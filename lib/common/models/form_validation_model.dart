class FormValidation {
  bool? status;
  String? message;
  FormValidation(status, message);
}

// To parse this JSON data, do
//
//     final postModel = postModelFromJson(jsonString);

class PostModel {
  PostStatus status;

  String traceId;
  DateTime timeStamp;

  PostModel({
    required this.status,
    required this.traceId,
    required this.timeStamp,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        status: PostStatus.fromJson(json["status"]),
        traceId: json["trace_id"],
        timeStamp: DateTime.parse(json["time_stamp"]),
      );
}

class PostStatus {
  String type;
  String message;
  int code;
  bool error;

  PostStatus({
    required this.type,
    required this.message,
    required this.code,
    required this.error,
  });

  factory PostStatus.fromJson(Map<String, dynamic> json) => PostStatus(
        type: json["type"],
        message: json["message"],
        code: json["code"],
        error: json["error"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "message": message,
        "code": code,
        "error": error,
      };
}

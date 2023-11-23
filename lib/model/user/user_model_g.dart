class MyProfileUserModel {
  final bool succeeded;
  final String message;
  final List<String>? errors; // List of errors, nullable
  final bool data; // Dynamic type for the data field, since it can be null

  MyProfileUserModel({
    required this.succeeded,
    required this.message,
    this.errors,
    required this.data,
  });

  factory MyProfileUserModel.fromJson(Map<String, dynamic> json) {
  return MyProfileUserModel(
    succeeded: json['succeeded'] ?? false,
    message: json['message'] ?? '',
    errors: json['errors'] != null ? List<String>.from(json['errors']) : null,
    data: json['data'] ?? false,
  );
}

}

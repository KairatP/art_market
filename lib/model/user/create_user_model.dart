class CreateUserModel {
  final bool? succeeded;
  final String? message;
  final dynamic errors;
  final dynamic data;

  CreateUserModel({
    required this.succeeded,
    required this.message,
    required this.errors,
    required this.data,
  });

  factory CreateUserModel.fromJson(Map<String, dynamic> json) {
    return CreateUserModel(
      succeeded: json['succeeded'], 
      message: json['message'], 
      errors: json['errors'],
      data: json['data'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'succeeded': succeeded,
      'message': message,
      'errors': errors,
      'data': data,
    };
  }
}





// class ApiResponse {
//   final bool succeeded;
//   final String message;
//   final dynamic errors; // Assuming errors can be of any type.
//   final dynamic data; // Assuming data can be of any type.

//   ApiResponse({
//     required this.succeeded,
//     required this.message,
//     this.errors,
//     this.data,
//   });

//   factory ApiResponse.fromJson(Map<String, dynamic> json) {
//     return ApiResponse(
//       succeeded: json['Succeeded'] ?? false,
//       message: json['Message'] ?? '',
//       errors: json['Errors'],
//       data: json['Data'],
//     );
//   }
// }

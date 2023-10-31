class ForgetPasswordUserModel {
  final dynamic succeeded;
  final dynamic message;
  final dynamic errors;
  final dynamic data;

  ForgetPasswordUserModel({
    required this.succeeded,
    required this.message,
    required this.errors,
    required this.data,
  });

  factory ForgetPasswordUserModel.fromJson(Map<String, dynamic> json) {
    return ForgetPasswordUserModel(
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
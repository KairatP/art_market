class UserProfileModel {
  final bool succeeded;
  final String? message;
  final dynamic errors;
  final UserProfileData data;

  UserProfileModel({
    required this.succeeded,
    this.message,
    this.errors,
    required this.data,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      succeeded: json['succeeded'] ?? false,
      message: json['message'],
      errors: json['errors'],
      data: UserProfileData.fromJson(json['data'] ?? {}),
    );
  }
}

class UserProfileData {
  final String id;
  final String name;
  final String phoneNumber;
  final String country;
  final String city;
  final String avaUrl;
  

  UserProfileData({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.country,
    required this.city,
    required this.avaUrl,
  });

  factory UserProfileData.fromJson(Map<String, dynamic> json) {
    return UserProfileData(
      id: json['id'] ?? "00000000-0000-0000-0000-000000000000",
      name: json['name'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      country: json['country'] ?? '',
      city: json['city'] ?? '',
      avaUrl: json['avaUrl'] ?? '',
    );
  }
}

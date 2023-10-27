class ProfileUser {
  String userId;
  String name;
  String avatar;
  String email;
  String phone;
  String country;
  String city;

  ProfileUser({
    required this.userId,
    required this.name,
    required this.avatar,
    required this.email,
    required this.phone,
    required this.country,
    required this.city,
  });

  factory ProfileUser.fromJson(Map<String, dynamic> json) {
    return ProfileUser(
      userId: json['userId'],
      name: json['name'],
      avatar: json['avatar'],
      email: json['email'],
      phone: json['phone'],
      country: json['country'],
      city: json['city'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'name': name,
      'avatar': avatar,
      'email': email,
      'phone': phone,
      'country': country,
      'city': city,
    };
  }
}

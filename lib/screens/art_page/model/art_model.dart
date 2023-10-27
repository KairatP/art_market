// import 'package:equatable/equatable.dart';

// class ArtModel extends Equatable {
//   final String name;
//   final String avatar;
//   final String id;
//   final String email;
//   final String phone;
//   final String country;
//   final String city;
//   final String price;
//   final String width;
//   final String hight;
//   final String color;
//   final String pano;
//   final String description;
//   final List<String> imageUrl;

//   const ArtModel({
//     required this.name,
//     required this.avatar,
//     required this.id,
//     required this.email,
//     required this.phone,
//     required this.country,
//     required this.city,
//     required this.price,
//     required this.imageUrl,
//     required this.width,
//     required this.hight,
//     required this.color,
//     required this.pano,
//     required this.description,
//   });

//   @override
//   List<Object?> get props => [name ,avatar, id, email, phone, country, city, price, imageUrl, width, hight, color, description, pano];
// }


class ArtModel  {
  String id;
  String name;
  String avatar;
  String email;
  String phone;
  String country;
  String city;
  String price;
  String width;
  String height;
  String color;
  String pano;
  String description;
  List<String> imageUrl;

  ArtModel ({
    required this.id,
    required this.name,
    required this.avatar,
    required this.email,
    required this.phone,
    required this.country,
    required this.city,
    required this.price,
    required this.width,
    required this.height,
    required this.color,
    required this.pano,
    required this.description,
    required this.imageUrl,
  });

  factory ArtModel .fromJson(Map<String, dynamic> json) {
    return ArtModel (
      id: json['id'],
      name: json['name'],
      avatar: json['avatar'],
      email: json['email'],
      phone: json['phone'],
      country: json['country'],
      city: json['city'],
      price: json['price'],
      width: json['width'],
      height: json['height'],
      color: json['color'],
      pano: json['pano'],
      description: json['description'],
      imageUrl: List<String>.from(json['imageUrl']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'avatar': avatar,
      'email': email,
      'phone': phone,
      'country': country,
      'city': city,
      'price': price,
      'width': width,
      'height': height,
      'color': color,
      'pano': pano,
      'description': description,
      'imageUrl': imageUrl,
    };
  }
}

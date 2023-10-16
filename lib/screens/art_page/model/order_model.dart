import 'package:equatable/equatable.dart';

class ArtModel extends Equatable {
  final String name;
  final String avatar;
  final String id;
  final String email;
  final String phone;
  final String country;
  final String city;
  final String price;
  final String width;
  final String hight;
  final String color;
  final String pano;
  final String description;
  final List<String> imageUrl;

  const ArtModel({
    required this.name,
    required this.avatar,
    required this.id,
    required this.email,
    required this.phone,
    required this.country,
    required this.city,
    required this.price,
    required this.imageUrl,
    required this.width,
    required this.hight,
    required this.color,
    required this.pano,
    required this.description,
  });

  @override
  List<Object?> get props => [name ,avatar, id, email, phone, country, city, price, imageUrl, width, hight, color, description, pano];
}

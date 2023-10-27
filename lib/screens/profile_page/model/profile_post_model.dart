import 'package:equatable/equatable.dart';

class ProfilePostModel extends Equatable {
  final String id;
  final String userId;
  final String price;
  final String width;
  final String hight;
  final String color;
  final String pano;
  final String description;
  final List<String> imageUrl;

  const ProfilePostModel({
    required this.id,
    required this.userId,
    required this.price,
    required this.imageUrl,
    required this.width,
    required this.hight,
    required this.color,
    required this.pano,
    required this.description,
  });

  @override
  List<Object?> get props => [id, userId,price, imageUrl, width, hight, color, description, pano];
}

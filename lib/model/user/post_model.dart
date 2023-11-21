import 'package:uuid/uuid.dart';

class PostArtModel {
  final bool succeeded;
  final String message;
  final dynamic errors;
  final ArtWorkData data;

  PostArtModel({
    required this.succeeded,
    required this.message,
    required this.errors,
    required this.data,
  });


  factory PostArtModel.fromJson(Map<String, dynamic> json) {
  return PostArtModel(
    succeeded: json['succeeded'],
    message: json['message'],
    errors: json['errors'],
    data: ArtWorkData.fromJson(json['data'] ?? {}), // Use {} as a default if 'data' is null
  );
}
}

class ArtWorkData {
  final int price;
  final String description;
  final int width;
  final int height;
  final String color;
  final String pano;
  final String? country;
  final String? city;
  final String? url;
  final String createdBy;
  final DateTime created;
  final String? lastModifiedBy;
  final DateTime? lastModified;
  final Uuid id;

  ArtWorkData({
    required this.price,
    required this.description,
    required this.width,
    required this.height,
    required this.color,
    required this.pano,
    required this.country,
    required this.city,
    required this.url,
    required this.createdBy,
    required this.created,
    required this.lastModifiedBy,
    required this.lastModified,
    required this.id,
  });

  factory ArtWorkData.fromJson(Map<String, dynamic> json) {
    return ArtWorkData(
      price: json['price'],
      description: json['description'],
      width: json['width'],
      height: json['height'],
      color: json['color'],
      pano: json['pano'],
      country: json['country'],
      city: json['city'],
      url: json['url'],
      createdBy: json['createdBy'],
      created: DateTime.parse(json['created']),
      lastModifiedBy: json['lastModifiedBy'],
      lastModified: json['lastModified'] != null
    ? DateTime.parse(json['lastModified'])
    : null,
      id: json['id'],
    );
  }
}

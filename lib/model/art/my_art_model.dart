class MyArtModel {
  final bool succeeded;
  final String message;
  final List<String> errors;
  final List<MyArtData> data;
  final int pageNumber;
  final int pageSize;
  final int recordsFiltered;
  final int recordsTotal;

  MyArtModel({
    required this.succeeded,
    required this.message,
    required this.errors,
    required this.data,
    required this.pageNumber,
    required this.pageSize,
    required this.recordsFiltered,
    required this.recordsTotal,
  });

  factory MyArtModel.fromJson(Map<String, dynamic> json) {
    return MyArtModel(
      succeeded: json['succeeded'] ?? false,
      message: json['message'] != null ? json['message'] as String : "",
      errors: List<String>.from(json['errors'] ?? [""]),
      data: (json['data'] as List<dynamic>?)
          ?.map((artworkJson) => MyArtData.fromJson(artworkJson))
          .toList() ??
          [],
      pageNumber: json['pageNumber'] as int? ?? 0,
      pageSize: json['pageSize'] as int? ?? 0,
      recordsFiltered: json['recordsFiltered'] as int? ?? 0,
      recordsTotal: json['recordsTotal'] as int? ?? 0,
    );
  }
}

class MyArtData {
  final String id;
  final int price;
  final String description;
  final int width;
  final int height;
  final String color;
  final String pano;
  final List<String> urls;
  final MyArtAuthor author;

  MyArtData({
    required this.id,
    required this.price,
    required this.description,
    required this.width,
    required this.height,
    required this.color,
    required this.pano,
    required this.urls,
    required this.author,
  });

  factory MyArtData.fromJson(Map<String, dynamic> json) {
    return MyArtData(
      id: json['id'] != null ? json['id'] as String : "",
      price: json['price'] as int? ?? 0,
      description: json['description'] != null ? json['description'] as String : "",
      width: json['width'] as int? ?? 0,
      height: json['height'] as int? ?? 0,
      color: json['color'] != null ? json['color'] as String : "",
      pano: json['pano'] != null ? json['pano'] as String : "",
      urls: List<String>.from(json['urls'] != null ?  List<String>.from(json['urls']) : [""]),
      author: MyArtAuthor.fromJson(json['author'] ?? {}),
    );
  }
}

class MyArtAuthor {
  final String id;
  final String name;
  final String phoneNumber;
  final String country;
  final String city;
  final String avaUrl;

  MyArtAuthor({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.country,
    required this.city,
    required this.avaUrl,
  });

  factory MyArtAuthor.fromJson(Map<String, dynamic> json) {
    return MyArtAuthor(
      id: json['id'] != null ? json['id'] as String : "",
      name: json['name'] != null ? json['name'] as String : "",
      phoneNumber: json['phoneNumber'] != null ? json['phoneNumber'] as String : "",
      country: json['country'] != null ? json['country'] as String : '',
      city: json['city'] != null ? json['city'] as String : "",
      avaUrl: json['avaUrl'] != null ? json['avaUrl'] as String : "",
    );
  }
}

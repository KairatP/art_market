part of 'edit_post_bloc.dart';

class EditPostState {
  // const HomeState();
  String userId;
  String postId;
  List<XFile>? images;
  int dotIndicator;
  String price;
  String description;
  String width;
  String height;
  String colorType;
  String panoType;
  List<String> imagesUrls;
  String avaUrl;
  String name;
  String phoneNumber;
  String country;
  String city;

  EditPostState({
    required this.userId,
    required this.postId,
    required this.images,
    required this.dotIndicator,
    required this.price,
    required this.description,
    required this.width,
    required this.height,
    required this.colorType,
    required this.panoType,
    required this.imagesUrls,
    required this.avaUrl,
    required this.name,
    required this.phoneNumber,
    required this.country,
    required this.city,
  });

  List<Object> get props => [];
}

class EditPostStateInitial extends EditPostState {
  EditPostStateInitial(
      {required super.userId,
      required super.postId,
      required super.images,
      required super.dotIndicator,
      required super.price,
      required super.description,
      required super.width,
      required super.height,
      required super.colorType,
      required super.panoType,
      required super.imagesUrls,
      required super.avaUrl,
      required super.name,
      required super.phoneNumber,
      required super.country,
      required super.city});
}

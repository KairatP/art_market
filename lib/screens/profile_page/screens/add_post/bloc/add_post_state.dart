part of 'add_post_bloc.dart';

class AddPostState {
  // const HomeState();
  List<XFile>? images;
  String price;
  String description;
  String width;
  String height;
  String colorType;
  String panoType;
  // String country;
  // String city;

  AddPostState({
    required this.images,
    required this.price,
    required this.description,
    required this.width,
    required this.height,
    required this.colorType,
    required this.panoType,
    // required this.country,
    // required this.city,
  });

  List<Object> get props => [];
}

class AddPostStateInitial extends AddPostState {
  AddPostStateInitial()
      : super(
            images: <XFile>[],
            price: '',
            description: '',
            width: '',
            height: '',
            colorType: '',
            panoType: '',
            );
}

class AddPostLoadingState extends AddPostState {
  AddPostLoadingState({required super.images, required super.price, required super.description, required super.width, required super.height, required super.colorType, required super.panoType});
}

abstract class AddPostActionState extends AddPostState {
  AddPostActionState({required super.images, required super.price, required super.description, required super.width, required super.height, required super.colorType, required super.panoType});
}
class AddPostIncorrectDataState extends AddPostActionState {
  AddPostIncorrectDataState({required super.images, required super.price, required super.description, required super.width, required super.height, required super.colorType, required super.panoType});
}
class AddPostFailedState extends AddPostActionState {
  AddPostFailedState({required super.images, required super.price, required super.description, required super.width, required super.height, required super.colorType, required super.panoType});
}

class SaveNewPostState extends AddPostActionState {
  SaveNewPostState({required super.images, required super.price, required super.description, required super.width, required super.height, required super.colorType, required super.panoType});
}

// class AddPostConfirmState extends AddPostActionState {
//   AddPostConfirmState({required super.images, required super.price, required super.description, required super.width, required super.height, required super.colorType, required super.panoType, required super.country, required super.city});
// }

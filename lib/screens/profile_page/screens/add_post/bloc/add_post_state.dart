part of 'add_post_bloc.dart';

// @immutable
// // abstract 
// class AddPostState {
//   final List<XFile>? images;

//   const AddPostState({this.images});

//   AddPostState copywith({List<XFile>? images}) =>
//       AddPostState(images: images ?? this.images);

// }

// class InitPostState extends  AddPostState {}
// class AddImagePostState extends AddPostState {
//   final List<XFile>? images;
//   AddImagePostState({this.images});
//   AddImagePostState copywith({List<XFile>? images}) =>
//       AddImagePostState(images: images ?? this.images);
// }


// class AddPostState {
//   final List<XFile> images;

//   const AddPostState({required this.images});

//   List<XFile?> get props => [];

// }


class AddPostState {
  // const HomeState();
  List<XFile>? images;
  AddPostState({required this.images});

  List<Object> get props => [];
}

class AddPostStateInitial extends AddPostState {
  AddPostStateInitial(): super(images: <XFile>[]);
}
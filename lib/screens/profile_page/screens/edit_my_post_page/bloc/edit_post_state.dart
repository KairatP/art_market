part of 'edit_post_bloc.dart';

class EditPostState {
  // const HomeState();
  List<XFile>? images;
  int dotIndicator;
  EditPostState({required this.images, required this.dotIndicator});

  List<Object> get props => [];
}

class EditPostStateInitial extends EditPostState {
  EditPostStateInitial() : super(images: <XFile>[], dotIndicator: 0);
}

part of 'add_post_bloc.dart';

abstract class AddPostEvent {}

class SelectImagePostEvent extends AddPostEvent {
  final List<XFile> images;
  SelectImagePostEvent(this.images);
}

class UnSelectImagePostEvent extends AddPostEvent {
  // final List<XFile> images;
  final int selectedindex;
  UnSelectImagePostEvent(this.selectedindex);
}

class EmptyImagePostEvent extends AddPostEvent {}

part of 'edit_post_bloc.dart';


abstract class EditPostEvent {}

class SelectImageEditPostEvent extends EditPostEvent {
  final List<XFile> images;
  SelectImageEditPostEvent(this.images);
}

class UnSelectImageEditPostEvent extends EditPostEvent {
  // final List<XFile> images;
  final int selectedindex;
  UnSelectImageEditPostEvent(this.selectedindex);
}

class DotIndicatorEvent extends EditPostEvent {
  final int dotIndicator;
  DotIndicatorEvent(this.dotIndicator);
}

class PhotoEditActionEvent extends EditPostEvent {}
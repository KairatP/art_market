part of 'edit_post_bloc.dart';

abstract class EditPostEvent {}

class EditPosInitialEvent extends EditPostEvent {}

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

class EditPosPriceEvent extends EditPostEvent {
  final String price;
  EditPosPriceEvent({required this.price});
}

class EditPosHeightEvent extends EditPostEvent {
  final String height;
  EditPosHeightEvent({required this.height});
}

class EditPosWidthEvent extends EditPostEvent {
  final String width;
  EditPosWidthEvent({required this.width});
}

class EditPosPanoEvent extends EditPostEvent {
  final String pano;
  EditPosPanoEvent({required this.pano});
}

class EditPosColorEvent extends EditPostEvent {
  final String color;
  EditPosColorEvent({required this.color});
}

class EditPosDescriptionEvent extends EditPostEvent {
  final String description;
  EditPosDescriptionEvent({required this.description});
}

class DeletePostEvent extends EditPostEvent {
  final String postId;
  DeletePostEvent({required this.postId});
}


class UpdateEditPostEvent extends EditPostEvent {
  // String id;
  // List<XFile>? images;
  // String price;
  // String description;
  // String width;
  // String height;
  // String colorType;
  // String panoType;

  // UpdateEditPostEvent({
  //   required this.id,
  //   required this.images,
  //   required this.price,
  //   required this.description,
  //   required this.width,
  //   required this.height,
  //   required this.colorType,
  //   required this.panoType,
  // });
}

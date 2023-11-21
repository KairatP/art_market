part of 'add_post_bloc.dart';

abstract class AddPostEvent {}

class InitialAddPostEvent extends AddPostEvent {}

class SelectImagePostEvent extends AddPostEvent {
  final List<XFile> images;
  SelectImagePostEvent(this.images);
}

class UnSelectImagePostEvent extends AddPostEvent {
  // final List<XFile> images;
  final int selectedindex;
  UnSelectImagePostEvent(this.selectedindex);
}

class SetPricePostEvent extends AddPostEvent {
  final String price;
  SetPricePostEvent(this.price);
}

class SetDescriptionPostEvent extends AddPostEvent {
  final String description;
  SetDescriptionPostEvent(this.description);
}

class SetWidthPostEvent extends AddPostEvent {
  final String width;
  SetWidthPostEvent(this.width);
}

class SetHeightPostEvent extends AddPostEvent {
  final String height;
  SetHeightPostEvent(this.height);
}

class SetColorTypePostEvent extends AddPostEvent {
  final String colorType;
  SetColorTypePostEvent(this.colorType);
}

class SetPanoTypePostEvent extends AddPostEvent {
  final String panoType;
  SetPanoTypePostEvent(this.panoType);
}

class SavePostEvent extends AddPostEvent {}







  
  
  
  
  
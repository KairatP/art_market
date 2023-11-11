part of 'profile_edit_bloc.dart';


abstract class ProfileEditEvent {}

class SelectImageProfileEvent extends ProfileEditEvent {
  final File images;
  SelectImageProfileEvent(this.images);
}

// class UnSelectImageProfiletEvent extends ProfileEditEvent {
//   // final List<XFile> images;
//   final int selectedindex;
//   UnSelectImageProfiletEvent(this.selectedindex);
// }
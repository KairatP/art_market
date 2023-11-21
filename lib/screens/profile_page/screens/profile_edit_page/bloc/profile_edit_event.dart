part of 'profile_edit_bloc.dart';

abstract class ProfileEditEvent {}

class SelectImageProfileEvent extends ProfileEditEvent {
  final File images;
  final String name;
  final String phoneNumber;
  final String country;
  final String city;

  SelectImageProfileEvent({
    required this.images,
    required this.name,
    required this.phoneNumber,
    required this.country,
    required this.city,
  });

  List<Object> get props => [];
}

class InitialEditProfileEvent extends ProfileEditEvent {}

class UpdateEditProfileEvent extends ProfileEditEvent {
  final File images;
  String name;
  String phoneNumber;
  String country;
  String city;

  UpdateEditProfileEvent(
    this.images,
    this.name,
    this.phoneNumber,
    this.country,
    this.city,
  );
}



// class UnSelectImageProfiletEvent extends ProfileEditEvent {
//   // final List<XFile> images;
//   final int selectedindex;
//   UnSelectImageProfiletEvent(this.selectedindex);
// }
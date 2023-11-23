part of 'profile_edit_bloc.dart';

class ProfileEditState {
  File? images;
  String imagesURL;
  String name;
  String phoneNumber;
  String country;
  String city;

  ProfileEditState({
    required this.images, 
    required this.imagesURL, 
    required this.name, 
    required this.phoneNumber,
    required this.country,
    required this.city,
  });

  List<Object> get props => [];
}

class ProfileEditStateInitial extends ProfileEditState {
  ProfileEditStateInitial({required super.images, required super.imagesURL, required super.name, required super.phoneNumber, required super.country, required super.city});
}

class EditProfileLoadingState extends ProfileEditState {
  EditProfileLoadingState({required super.images, required super.imagesURL, required super.name, required super.phoneNumber, required super.country, required super.city});
}

class ProfileUpdateState extends ProfileEditState {
  ProfileUpdateState({required super.images, required super.imagesURL, required super.name, required super.phoneNumber, required super.country, required super.city});
}


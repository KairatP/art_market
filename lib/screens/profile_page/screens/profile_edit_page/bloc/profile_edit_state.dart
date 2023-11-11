part of 'profile_edit_bloc.dart';

class ProfileEditState {
  File? images;
  ProfileEditState({required this.images});

  List<Object> get props => [];
}

class ProfileEditStateInitial extends ProfileEditState {
  ProfileEditStateInitial() : super(images: null);
}

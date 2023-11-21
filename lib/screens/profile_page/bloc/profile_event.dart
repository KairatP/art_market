part of 'profile_bloc.dart';

abstract class ProfileEvent {}

class InitialProfileEvent extends  ProfileEvent with EquatableMixin {
  @override
  List<Object?> get props => [];
}

class ProfileLoadedEvent extends  ProfileEvent with EquatableMixin {
  @override
  List<Object?> get props => [];
}

class EditProfileButtonNavigateEvent extends ProfileEvent {}
class AddPostButtonNavigateEvent extends ProfileEvent {}
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

class ProfileURLReloadEvent extends  ProfileEvent {}
class CallFromOtherBlocEvent extends  ProfileEvent {}

class EditProfileButtonNavigateEvent extends ProfileEvent {}
class AddPostButtonNavigateEvent extends ProfileEvent {}
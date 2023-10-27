part of 'profile_bloc.dart';

abstract class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileSuccsesState extends ProfileState {}

final class ProfilePostListSuccsesState extends ProfileState
    with EquatableMixin {
  final List<ProfilePostModel> postList;
  ProfileUser profileUserData;

  ProfilePostListSuccsesState({required this.postList, required this.profileUserData});
  @override
  List<Object?> get props => [];
}

final class ProfilePostErrorState extends ProfileState {}

abstract class ProfileActionState extends ProfileState {}
class ProfileEditActionState extends ProfileActionState {}
class AddPostActionState extends ProfileActionState {}

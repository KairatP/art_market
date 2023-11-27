part of 'profile_bloc.dart';

abstract class ProfileState {}

final class ProfileInitial extends ProfileState {}

class ProfileLoadingState extends ProfileState {}

final class ProfilePostListSuccsesState extends ProfileState {
  final List<MyArtData> postList;
  final UserProfileModel profileUserData;

  ProfilePostListSuccsesState({
    required this.profileUserData,
    required this.postList,
  });
}

final class ProfilePostErrorState extends ProfileState {}

abstract class ProfileActionState extends ProfileState {}

final class CallFromOtherBlocState extends ProfileActionState {}

part of 'profile_bloc.dart';

abstract class ProfileState {}

final class ProfileInitial extends ProfileState {}

class ProfileLoadingState extends ProfileState {}

final class ProfilePostListSuccsesState extends ProfileState
    with EquatableMixin 
    {
  final List<MyArtData> postList;
  final UserProfileModel profileUserData;

  ProfilePostListSuccsesState({
    required this.profileUserData,
    required this.postList,
  });
  @override
  List<Object?> get props => [postList, profileUserData];
}

final class ProfilePostErrorState extends ProfileState {}

abstract class ProfileActionState extends ProfileState {}

final class CallFromOtherBlocState extends ProfileActionState {}

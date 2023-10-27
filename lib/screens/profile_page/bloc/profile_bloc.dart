import 'dart:async';

import 'package:art_market/screens/profile_page/data/profile_post_data.dart';
import 'package:art_market/screens/profile_page/model/profile_model.dart';
import 'package:art_market/screens/profile_page/model/profile_post_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<InitialProfileEvent>(_onInitialProfileEvent);
    on<EditProfileButtonNavigateEvent>(_onEditProfileButtonNavigateEvent);
    on<AddPostButtonNavigateEvent>(_onAddPostButtonNavigateEvent);
  }

  FutureOr<void> _onInitialProfileEvent(
      InitialProfileEvent event, Emitter<ProfileState> emit) async {
    emit(ProfileInitial());
    ProfileUser user = ProfileUser.fromJson(ProfileData.profileData);
    emit(ProfilePostListSuccsesState(
      profileUserData: user,
      postList: ProfileData.profilePostDataList
          .map((e) => ProfilePostModel(
              id: e["id"],
              userId: e["userId"],

              price: e["price"],
              width: e["width"],
              hight: e["hight"],
              color: e["color"],
              pano: e["pano"],
              description: e["description"],
              imageUrl: e["imageUrl"]))
          .toList(),
    ));
  }

  FutureOr<void> _onEditProfileButtonNavigateEvent(
      EditProfileButtonNavigateEvent event, Emitter<ProfileState> emit) {
    emit(ProfileEditActionState());
  }

  FutureOr<void> _onAddPostButtonNavigateEvent(
      AddPostButtonNavigateEvent event, Emitter<ProfileState> emit) {
        emit(AddPostActionState());
  }
}

import 'dart:async';

import 'package:art_market/dependencies/services/delivery_service.dart';
import 'package:art_market/model/art/my_art_model.dart';
import 'package:art_market/model/user/user_profile_model.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ArtDeliveryService postService;
  ProfileBloc({required this.postService}) : super(ProfileInitial()) {
    on<InitialProfileEvent>(_onInitialProfileEvent);
    on<ProfileLoadedEvent>(_onProfileLoadedEvent);
  }

  FutureOr<void> _onInitialProfileEvent(
      InitialProfileEvent event, Emitter<ProfileState> emit) async {
    if (state is! ProfileLoadingState) {
      emit(ProfileLoadingState());
    }

    if (profileFirstLoad == true) {
      _oldOwnPostList.clear();
      try {
        MyArtModel loadedPostData = await postService.getMyArtList(1, 10);
        UserProfileModel loadedUserProfileData =
            await postService.getMyProfile();
        emit(ProfilePostListSuccsesState(
          postList: loadedPostData.data,
          profileUserData: loadedUserProfileData,
        ));
        _oldOwnPostList.addAll(loadedPostData.data);
        _userData.add(loadedUserProfileData);
        profileFirstLoad = false;
      } on DioException {
        // emit(AddPostFailedState());
      } catch (e) {
        rethrow;
      }
    } else {
      emit(ProfilePostListSuccsesState(
        postList: _oldOwnPostList,
        profileUserData: _userData.first,
      ));
    }
  }

  Future<FutureOr<void>> _onProfileLoadedEvent(
      ProfileLoadedEvent event, Emitter<ProfileState> emit) async {
    _myPageNumber = _myPageNumber + 1;
    try {
      MyArtModel loadedPostData =
          await postService.getMyArtList(_myPageNumber, 10);
      _oldOwnPostList.addAll(loadedPostData.data);

      emit(ProfilePostListSuccsesState(
        postList: _oldOwnPostList,
        profileUserData: _userData.first,
      ));
    } on DioException {
      // emit(AddPostFailedState());
    } catch (e) {
      rethrow;
    }
  }
}

bool profileFirstLoad = true;
final _oldOwnPostList = <MyArtData>[];
final _userData = <UserProfileModel>[];
int _myPageNumber = 1;

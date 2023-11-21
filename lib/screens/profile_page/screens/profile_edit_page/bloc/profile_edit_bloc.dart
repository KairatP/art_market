import 'dart:async';
import 'dart:io';

import 'package:art_market/dependencies/services/delivery_service.dart';
import 'package:art_market/model/user/user_profile_model.dart';
import 'package:bloc/bloc.dart';

part 'profile_edit_event.dart';
part 'profile_edit_state.dart';

class ProfileEditBloc extends Bloc<ProfileEditEvent, ProfileEditState> {
  ArtDeliveryService postService;
  final UserProfileModel userProfile;

  ProfileEditBloc({required this.userProfile, required this.postService})
      : super(ProfileEditStateInitial(
            images: File(''),
            imagesURL: userProfile.data.avaUrl,
            name: userProfile.data.name,
            phoneNumber: userProfile.data.phoneNumber,
            country: userProfile.data.country,
            city: userProfile.data.city)) {
    on<SelectImageProfileEvent>(_onSelectImageProfileEvent);
    on<InitialEditProfileEvent>(_onInitialEditProfileEvent);
    on<UpdateEditProfileEvent>(_onUpdateEditProfileEvent);
  }

  Future<FutureOr<void>> _onSelectImageProfileEvent(
      SelectImageProfileEvent event, Emitter<ProfileEditState> emit) async {
    emit(ProfileEditState(
        images: event.images,
        name: event.name,
        phoneNumber: event.phoneNumber,
        country: event.country,
        city: event.city,
        imagesURL: state.imagesURL));
  }

  Future<FutureOr<void>> _onInitialEditProfileEvent(
      InitialEditProfileEvent event, Emitter<ProfileEditState> emit) async {
    emit(ProfileEditState(
      images: state.images,
      name: userProfile.data.name,
      phoneNumber: userProfile.data.phoneNumber,
      country: userProfile.data.country,
      city: userProfile.data.city,
      imagesURL: userProfile.data.avaUrl,
    ));
  }

  Future<FutureOr<void>> _onUpdateEditProfileEvent(
      UpdateEditProfileEvent event, Emitter<ProfileEditState> emit) async {
    // ProfileBloc
    try {
      await postService.updateMyProfile(event.images, event.name,
          event.phoneNumber, event.country, event.city);
      // ProfileBloc.add(InitialProfileEvent());
    } catch (e) {
      rethrow;
    }
  }
}

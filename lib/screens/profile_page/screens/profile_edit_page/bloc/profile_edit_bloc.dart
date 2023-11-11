import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';

part 'profile_edit_event.dart';
part 'profile_edit_state.dart';

class ProfileEditBloc extends Bloc<ProfileEditEvent, ProfileEditState> {
  ProfileEditBloc() : super(ProfileEditStateInitial()) {
    on<SelectImageProfileEvent>(_onSelectImageProfileEvent);
  }

  FutureOr<void> _onSelectImageProfileEvent(
      SelectImageProfileEvent event, Emitter<ProfileEditState> emit) {
    emit(ProfileEditState(images: event.images));
  }
}

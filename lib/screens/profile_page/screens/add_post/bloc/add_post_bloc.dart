import 'dart:async';

import 'package:bloc/bloc.dart';
// import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

part 'add_post_event.dart';
part 'add_post_state.dart';

class AddPostBloc extends Bloc<AddPostEvent, AddPostState> {
  AddPostBloc() : super(AddPostStateInitial()) {
    on<SelectImagePostEvent>(_onSelectImagePostEvent);
    on<UnSelectImagePostEvent>(_onUnSelectImagePostEvent);
    on<EmptyImagePostEvent>(_onEmptyImagePostEvent);
  }

  FutureOr<void> _onSelectImagePostEvent(
      SelectImagePostEvent event, Emitter<AddPostState> emit) {
    state.images!.addAll(event.images);
    emit(AddPostState(images: state.images));
  }

  FutureOr<void> _onUnSelectImagePostEvent(
      UnSelectImagePostEvent event, Emitter<AddPostState> emit) {
    state.images!.removeAt(event.selectedindex);
    emit(AddPostState(images: state.images));
  }

  FutureOr<void> _onEmptyImagePostEvent(
      EmptyImagePostEvent event, Emitter<AddPostState> emit) {
    emit(AddPostState(images: []));
  }
}

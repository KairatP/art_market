import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'edit_post_event.dart';
part 'edit_post_state.dart';

class EditPostBloc extends Bloc<EditPostEvent, EditPostState> {
  EditPostBloc() : super(EditPostStateInitial()) {
    on<SelectImageEditPostEvent>(_onSelectImageEditPostEvent);
    on<UnSelectImageEditPostEvent>(_onUnSelectImageEditPostEvent);
    on<DotIndicatorEvent>(_onDotIndicatorEvent);
    on<PhotoEditActionEvent>(_onPhotoEditActionEvent);
  }

  FutureOr<void> _onSelectImageEditPostEvent(
      SelectImageEditPostEvent event, Emitter<EditPostState> emit) {
        state.images!.addAll(event.images);
    emit(EditPostState(images: state.images, dotIndicator: state.dotIndicator));
  }

  FutureOr<void> _onUnSelectImageEditPostEvent(
      UnSelectImageEditPostEvent event, Emitter<EditPostState> emit) {
    state.images!.removeAt(event.selectedindex);
    emit(EditPostState(images: state.images, dotIndicator: state.dotIndicator));
  }

  FutureOr<void> _onDotIndicatorEvent(
      DotIndicatorEvent event, Emitter<EditPostState> emit) {
    emit(EditPostState(images: state.images, dotIndicator: event.dotIndicator));
  }

  FutureOr<void> _onPhotoEditActionEvent(
      PhotoEditActionEvent event, Emitter<EditPostState> emit) {
    emit(EditPostState(images: state.images, dotIndicator: state.dotIndicator));
  }
}

import 'dart:async';
import 'dart:io';

import 'package:art_market/dependencies/services/delivery_service.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

part 'add_post_event.dart';
part 'add_post_state.dart';

class AddPostBloc extends Bloc<AddPostEvent, AddPostState> {
  ArtDeliveryService postService;

  AddPostBloc({required this.postService}) : super(AddPostStateInitial()) {
    on<SelectImagePostEvent>(_onSelectImagePostEvent);
    on<UnSelectImagePostEvent>(_onUnSelectImagePostEvent);
    on<SavePostEvent>(_onSavePostEvent);
    on<SetPricePostEvent>(_onSetPricePostEvent);
    on<SetDescriptionPostEvent>(_onSetDescriptionPostEvent);
    on<SetColorTypePostEvent>(_onSetColorTypePostEvent);
    on<SetPanoTypePostEvent>(_onSetPanoTypePostEvent);
    on<SetWidthPostEvent>(_onSetWidthPostEvent);
    on<SetHeightPostEvent>(_onSetHeightPostEvent);
    on<InitialAddPostEvent>(_onInitialAddPostEvent);
  }

  FutureOr<void> _onInitialAddPostEvent(
      InitialAddPostEvent event, Emitter<AddPostState> emit) async {
    try {
      emit(AddPostState(
        images: state.images,
        price: state.price,
        description: state.description,
        width: state.width,
        height: state.height,
        colorType: state.colorType,
        panoType: state.panoType,
      ));
    } on DioException {
      // emit(AddPostFailedState(
      //   ));
    } catch (e) {
      emit(AddPostFailedState(
        images: state.images,
        price: state.price,
        description: state.description,
        width: state.width,
        height: state.height,
        colorType: state.colorType,
        panoType: state.panoType,
      ));
      rethrow;
    }
  }

  FutureOr<void> _onSelectImagePostEvent(
      SelectImagePostEvent event, Emitter<AddPostState> emit) {
    state.images!.addAll(event.images);
    emit(AddPostState(
      images: state.images,
      price: state.price,
      description: state.description,
      width: state.width,
      height: state.height,
      colorType: state.colorType,
      panoType: state.panoType,
    ));
  }

  FutureOr<void> _onUnSelectImagePostEvent(
      UnSelectImagePostEvent event, Emitter<AddPostState> emit) {
    state.images!.removeAt(event.selectedindex);
    emit(AddPostState(
      images: state.images,
      price: state.price,
      description: state.description,
      width: state.width,
      height: state.height,
      colorType: state.colorType,
      panoType: state.panoType,
    ));
  }

  FutureOr<void> _onSetPricePostEvent(
      SetPricePostEvent event, Emitter<AddPostState> emit) {
    emit(AddPostState(
      images: state.images,
      price: event.price,
      description: state.description,
      width: state.width,
      height: state.height,
      colorType: state.colorType,
      panoType: state.panoType,
    ));
  }

  FutureOr<void> _onSetDescriptionPostEvent(
      SetDescriptionPostEvent event, Emitter<AddPostState> emit) {
    emit(AddPostState(
      images: state.images,
      price: state.price,
      description: event.description,
      width: state.width,
      height: state.height,
      colorType: state.colorType,
      panoType: state.panoType,
    ));
  }

  FutureOr<void> _onSetColorTypePostEvent(
      SetColorTypePostEvent event, Emitter<AddPostState> emit) {
    emit(AddPostState(
      images: state.images,
      price: state.price,
      description: state.description,
      width: state.width,
      height: state.height,
      colorType: event.colorType,
      panoType: state.panoType,
    ));
  }

  FutureOr<void> _onSetPanoTypePostEvent(
      SetPanoTypePostEvent event, Emitter<AddPostState> emit) {
    emit(AddPostState(
      images: state.images,
      price: state.price,
      description: state.description,
      width: state.width,
      height: state.height,
      colorType: state.colorType,
      panoType: event.panoType,
    ));
  }

  FutureOr<void> _onSetWidthPostEvent(
      SetWidthPostEvent event, Emitter<AddPostState> emit) {
    emit(AddPostState(
      images: state.images,
      price: state.price,
      description: state.description,
      width: event.width,
      height: state.height,
      colorType: state.colorType,
      panoType: state.panoType,
    ));
  }

  FutureOr<void> _onSetHeightPostEvent(
      SetHeightPostEvent event, Emitter<AddPostState> emit) {
    emit(AddPostState(
      images: state.images,
      price: state.price,
      description: state.description,
      width: state.width,
      height: event.height,
      colorType: state.colorType,
      panoType: state.panoType,
    ));
  }

  Future<FutureOr<void>> _onSavePostEvent(
      SavePostEvent event, Emitter<AddPostState> emit) async {
    List<File> filelist = [];
    for (var element in state.images!) {
      filelist.add(File(element.path));
    }
    int price = int.parse(state.price.toString());
    int width = int.parse(state.width.toString());
    int height = int.parse(state.height.toString());
    try {
      await postService.postMyArt(
          price,
          state.description.toString(),
          width,
          height,
          state.colorType.toString(),
          state.panoType.toString(),
          filelist);
    } on DioException {
      rethrow;
    } catch (e) {
      rethrow;
    }
    emit(AddPostLoadingState(images: [], price: '', description: '', width: '', height: '', colorType: '', panoType: ''));
  }
}

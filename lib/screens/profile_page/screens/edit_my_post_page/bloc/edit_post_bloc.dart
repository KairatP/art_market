import 'dart:async';
import 'dart:io';

import 'package:art_market/dependencies/services/delivery_service.dart';
import 'package:art_market/model/art/my_art_model.dart';
import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'edit_post_event.dart';
part 'edit_post_state.dart';

class EditPostBloc extends Bloc<EditPostEvent, EditPostState> {
  ArtDeliveryService postService;
  final MyArtData userPost;

  EditPostBloc({required this.postService, required this.userPost})
      : super(EditPostStateInitial(
          images: [],
          dotIndicator: 0,
          userId: userPost.author.id,
          postId: userPost.id,
          price: userPost.price.toString(),
          description: userPost.description,
          width: userPost.width.toString(),
          height: userPost.height.toString(),
          colorType: userPost.color,
          panoType: userPost.pano,
          imagesUrls: userPost.urls,
          avaUrl: userPost.author.avaUrl,
          name: userPost.author.name,
          phoneNumber: userPost.author.phoneNumber,
          country: userPost.author.country,
          city: userPost.author.city,
        )) {
    on<SelectImageEditPostEvent>(_onSelectImageEditPostEvent);
    on<UnSelectImageEditPostEvent>(_onUnSelectImageEditPostEvent);
    on<DotIndicatorEvent>(_onDotIndicatorEvent);
    on<EditPosInitialEvent>(_onEditPosInitialEvent);
    on<EditPosPriceEvent>(_onEditPosPriceEvent);
    on<EditPosHeightEvent>(_onUEditPosHeightEvent);
    on<EditPosWidthEvent>(_onEditPosWidthEvent);
    on<EditPosPanoEvent>(_onEditPosPanoEvent);
    on<EditPosColorEvent>(_onEditPosColorEvent);
    on<EditPosDescriptionEvent>(_onEditPosDescriptionEvent);
    on<UpdateEditPostEvent>(_onUpdateEditPostEvent);
    on<DeletePostEvent>(_onDeletePostEvent);
    
  }

  FutureOr<void> _onEditPosInitialEvent(
      EditPosInitialEvent event, Emitter<EditPostState> emit) {
    emit(EditPostState(
      images: state.images,
      dotIndicator: state.dotIndicator,
      userId: state.userId,
      price: state.price,
      description: state.description,
      width: state.width,
      height: state.height,
      colorType: state.colorType,
      panoType: state.panoType,
      imagesUrls: state.imagesUrls,
      avaUrl: state.avaUrl,
      name: state.name,
      phoneNumber: state.phoneNumber,
      country: state.country,
      city: state.city,
      postId: state.postId,
    ));
  }

  FutureOr<void> _onSelectImageEditPostEvent(
      SelectImageEditPostEvent event, Emitter<EditPostState> emit) {
    state.images!.addAll(event.images);
    emit(EditPostState(
      images: state.images,
      dotIndicator: state.dotIndicator,
      userId: state.userId,
      postId: state.postId,
      price: state.price,
      description: state.description,
      width: state.width,
      height: state.height,
      colorType: state.colorType,
      panoType: state.panoType,
      imagesUrls: state.imagesUrls,
      avaUrl: state.avaUrl,
      name: state.name,
      phoneNumber: state.phoneNumber,
      country: state.country,
      city: state.city,
    ));
  }

  FutureOr<void> _onUnSelectImageEditPostEvent(
      UnSelectImageEditPostEvent event, Emitter<EditPostState> emit) {
    state.images!.removeAt(event.selectedindex);
    emit(EditPostState(
      images: state.images,
      dotIndicator: state.dotIndicator,
      userId: state.userId,
      postId: state.postId,
      price: state.price,
      description: state.description,
      width: state.width,
      height: state.height,
      colorType: state.colorType,
      panoType: state.panoType,
      imagesUrls: state.imagesUrls,
      avaUrl: state.avaUrl,
      name: state.name,
      phoneNumber: state.phoneNumber,
      country: state.country,
      city: state.city,
    ));
  }

  FutureOr<void> _onDotIndicatorEvent(
      DotIndicatorEvent event, Emitter<EditPostState> emit) {
    emit(EditPostState(
      images: state.images,
      dotIndicator: event.dotIndicator,
      userId: state.userId,
      postId: state.postId,
      price: state.price,
      description: state.description,
      width: state.width,
      height: state.height,
      colorType: state.colorType,
      panoType: state.panoType,
      imagesUrls: state.imagesUrls,
      avaUrl: state.avaUrl,
      name: state.name,
      phoneNumber: state.phoneNumber,
      country: state.country,
      city: state.city,
    ));
  }

  FutureOr<void> _onEditPosPriceEvent(EditPosPriceEvent event, Emitter<EditPostState> emit) {
    emit(EditPostState(
      images: state.images,
      dotIndicator: state.dotIndicator,
      userId: state.userId,
      postId: state.postId,
      price: event.price,
      description: state.description,
      width: state.width,
      height: state.height,
      colorType: state.colorType,
      panoType: state.panoType,
      imagesUrls: state.imagesUrls,
      avaUrl: state.avaUrl,
      name: state.name,
      phoneNumber: state.phoneNumber,
      country: state.country,
      city: state.city,
    ));
  }

  FutureOr<void> _onUEditPosHeightEvent(EditPosHeightEvent event, Emitter<EditPostState> emit) {
    emit(EditPostState(
      images: state.images,
      dotIndicator: state.dotIndicator,
      userId: state.userId,
      postId: state.postId,
      price: state.price,
      description: state.description,
      width: state.width,
      height: event.height,
      colorType: state.colorType,
      panoType: state.panoType,
      imagesUrls: state.imagesUrls,
      avaUrl: state.avaUrl,
      name: state.name,
      phoneNumber: state.phoneNumber,
      country: state.country,
      city: state.city,
    ));
  }

  FutureOr<void> _onEditPosWidthEvent(EditPosWidthEvent event, Emitter<EditPostState> emit) {
    emit(EditPostState(
      images: state.images,
      dotIndicator: state.dotIndicator,
      userId: state.userId,
      postId: state.postId,
      price: state.price,
      description: state.description,
      width: event.width,
      height: state.height,
      colorType: state.colorType,
      panoType: state.panoType,
      imagesUrls: state.imagesUrls,
      avaUrl: state.avaUrl,
      name: state.name,
      phoneNumber: state.phoneNumber,
      country: state.country,
      city: state.city,
    ));
  }

  FutureOr<void> _onEditPosPanoEvent(EditPosPanoEvent event, Emitter<EditPostState> emit) {
    emit(EditPostState(
      images: state.images,
      dotIndicator: state.dotIndicator,
      userId: state.userId,
      postId: state.postId,
      price: state.price,
      description: state.description,
      width: state.width,
      height: state.height,
      colorType: state.colorType,
      panoType: event.pano,
      imagesUrls: state.imagesUrls,
      avaUrl: state.avaUrl,
      name: state.name,
      phoneNumber: state.phoneNumber,
      country: state.country,
      city: state.city,
    ));
  }

  FutureOr<void> _onEditPosColorEvent(EditPosColorEvent event, Emitter<EditPostState> emit) {
    emit(EditPostState(
      images: state.images,
      dotIndicator: state.dotIndicator,
      userId: state.userId,
      postId: state.postId,
      price: state.price,
      description: state.description,
      width: state.width,
      height: state.height,
      colorType: event.color,
      panoType: state.panoType,
      imagesUrls: state.imagesUrls,
      avaUrl: state.avaUrl,
      name: state.name,
      phoneNumber: state.phoneNumber,
      country: state.country,
      city: state.city,
    ));
  }

  FutureOr<void> _onEditPosDescriptionEvent(EditPosDescriptionEvent event, Emitter<EditPostState> emit) {
    emit(EditPostState(
      images: state.images,
      dotIndicator: state.dotIndicator,
      userId: state.userId,
      postId: state.postId,
      price: state.price,
      description: event.description,
      width: state.width,
      height: state.height,
      colorType: state.colorType,
      panoType: state.panoType,
      imagesUrls: state.imagesUrls,
      avaUrl: state.avaUrl,
      name: state.name,
      phoneNumber: state.phoneNumber,
      country: state.country,
      city: state.city,
    ));
  }

    Future<FutureOr<void>> _onUpdateEditPostEvent(
      UpdateEditPostEvent event, Emitter<EditPostState> emit) async {
    List<File> filelist = [];
    if (state.images != null) {
      for (var element in state.images!) {
        filelist.add(File(element.path));
      }
    } else {
      filelist = [];
    }

    int price = int.parse(state.price);
    int width = int.parse(state.width);
    int height = int.parse(state.height);
    try {
      await postService.updateMyPost(state.postId, price, state.description, width,
          height, state.colorType, state.panoType, filelist);
    } catch (e) {
      rethrow;
    }
  }

  Future<FutureOr<void>> _onDeletePostEvent(DeletePostEvent event, Emitter<EditPostState> emit) async {
    try {
      await postService.deletePost(event.postId);
    } catch (e) {
      rethrow;
    }

  }
}

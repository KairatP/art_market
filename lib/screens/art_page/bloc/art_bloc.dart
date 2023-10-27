import 'dart:async';

import 'package:art_market/screens/art_page/data/art_data.dart';
import 'package:art_market/screens/art_page/model/art_model.dart';
import 'package:art_market/dependencies/services/delivery_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'art_event.dart';
part 'art_state.dart';

class ArtBloc extends Bloc<ArtEvent, ArtState> {
  ArtBloc() : super(ArtInitial()) {
    on<InitialOrderEvent>(_onInitialOrderEvent);
    on<FilterButtonNavigateEvent>(_onFilterButtonNavigateEvent);
    on<SearchUserEvent>(_onSearchUserEvent);
    on<FilterUserEvent>(_onFilterUserEvent);
    // on<FilterViewSelectedEvent>(_onFilterViewSelectedEvent);
  }

  // Inisiate first data loading
  FutureOr<void> _onInitialOrderEvent(
      InitialOrderEvent event, Emitter<ArtState> emit) async {
    if (_artDataStatus == false) {
      emit(ArtLoadingState());
      await Future.delayed(const Duration(seconds: 2));
      emit(ArtLoadedSuccsesState(
        artList: ArtData.artList
            .map((e) => ArtModel(
                name: e['name'],
                avatar: e["avatar"],
                id: e["id"],
                email: e["email"],
                phone: e["phone"],
                country: e["country"],
                city: e["city"],
                price: e["price"],
                width: e["width"],
                height: e["hight"],
                color: e["color"],
                pano: e["pano"],
                description: e["description"],
                imageUrl: e["imageUrl"]))
            .toList(),
      ));

      ArtLoadedSuccsesState curentState = state as ArtLoadedSuccsesState;
      _oldPostList = curentState.artList;

      _artDataStatus = true;
    } else {
      emit(ArtLoadedSuccsesState(artList: _oldPostList));
    }
  }

  FutureOr<void> _onFilterButtonNavigateEvent(
      FilterButtonNavigateEvent event, Emitter<ArtState> emit) {
    emit(ArtFilterActionState());
  }

  FutureOr<void> _onSearchUserEvent(
      SearchUserEvent event, Emitter<ArtState> emit) async {
    final res = await service.getArtList(event.query);
    emit(ArtLoadedSuccsesState(artList: res));
  }

  FutureOr<void> _onFilterUserEvent(
      FilterUserEvent event, Emitter<ArtState> emit) {
    // filder post and get service needed
    event.city;
    event.country;

    if (event.city.isNotEmpty || event.country.isNotEmpty) {
      // emit(ArtFilterrSelectedState());

      emit(ArtLoadedSuccsesState(
        artList: ArtData.filteredList
            .map((e) => ArtModel(
                name: e['name'],
                avatar: e["avatar"],
                id: e["id"],
                email: e["email"],
                phone: e["phone"],
                country: e["country"],
                city: e["city"],
                price: e["price"],
                width: e["width"],
                height: e["hight"],
                color: e["color"],
                pano: e["pano"],
                description: e["description"],
                imageUrl: e["imageUrl"]))
            .toList(),
      ));
    } else {
      emit(ArtLoadedSuccsesState(artList: _oldPostList));
    }
  }

  // FutureOr<void> _onFilterViewSelectedEvent(
  //     FilterViewSelectedEvent event, Emitter<ArtState> emit) {
  //   emit(ArtLoadedSuccsesState(
  //     artList: ArtData.filteredList
  //         .map((e) => ArtModel(
  //             name: e['name'],
  //             avatar: e["avatar"],
  //             id: e["id"],
  //             email: e["email"],
  //             phone: e["phone"],
  //             country: e["country"],
  //             city: e["city"],
  //             price: e["price"],
  //             width: e["width"],
  //             height: e["hight"],
  //             color: e["color"],
  //             pano: e["pano"],
  //             description: e["description"],
  //             imageUrl: e["imageUrl"]))
  //         .toList(),
  //   ));
  // }
}

bool _artDataStatus = false;
var _oldPostList = <ArtModel>[];

const apiUrl = "";

final ArtDeliveryService service = ArtDeliveryService as ArtDeliveryService;

// EventTransformer<E> debounceDroppable<E>(Duration duration) {
//   return (events, mapper) {
//     return droppable<E>().call(events.debounce(duration), mapper);
//   };
// }

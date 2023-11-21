import 'dart:async';

import 'package:art_market/model/art/art_model.dart';
import 'package:art_market/dependencies/services/delivery_service.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'art_event.dart';
part 'art_state.dart';

class ArtBloc extends Bloc<ArtEvent, ArtState> {
  ArtDeliveryService artService;
  ArtBloc({required this.artService}) : super(ArtInitial()) {
    on<InitialOrderEvent>(_onInitialOrderEvent);
    on<ProfilePaginationEvent>(_onProfilePaginationEvent);
    on<SearchUserEvent>(_onSearchUserEvent);
    on<FilterUserEvent>(_onFilterUserEvent);
    on<FilterButtonNavigateEvent>(_onFilterButtonNavigateEvent);
  }

  // Inisiate first data loading
  FutureOr<void> _onInitialOrderEvent(
      InitialOrderEvent event, Emitter<ArtState> emit) async {
    if (state is! ArtLoadingState) {
      emit(ArtLoadingState());
    }

    if (artFirstLoad == true) {
      try {
        _oldPostList.clear();
        ArtModel loadedArtData =
            await artService.getArtList(_pageNumber, 5, '');
        emit(ArtLoadedSuccsesState(artList: loadedArtData.data));
        _oldPostList.addAll(loadedArtData.data);
        artFirstLoad = false;
      } on DioException {
        // emit(AddPostFailedState());
      } catch (e) {
        rethrow;
      }
    } else {
      emit(ArtLoadedSuccsesState(artList: _oldPostList));
    }
  }

  Future<FutureOr<void>> _onProfilePaginationEvent(
      ProfilePaginationEvent event, Emitter<ArtState> emit) async {
    _pageNumber = _pageNumber + 1;
    try {
      ArtModel loadedArtData =
          await artService.getArtList(_pageNumber, 5, event.searchText);
      _oldPostList.addAll(loadedArtData.data);
      emit(ArtLoadedSuccsesState(artList: _oldPostList));
    } on DioException {
      // emit(AddPostFailedState());
    } catch (e) {
      rethrow;
    }
  }

  FutureOr<void> _onSearchUserEvent(
      SearchUserEvent event, Emitter<ArtState> emit) async {
    _pageNumber = 1;
    try {
      ArtModel loadedArtData =
          await artService.getArtList(_pageNumber, 5, event.searchText);
      emit(ArtLoadedSuccsesState(artList: loadedArtData.data));
      _oldPostList.addAll(loadedArtData.data);
      _pageNumber = _pageNumber + 1;
    } on DioException {
      // emit(AddPostFailedState());
    } catch (e) {
      rethrow;
    }
  }

  FutureOr<void> _onFilterUserEvent(
      FilterUserEvent event, Emitter<ArtState> emit) {}

  FutureOr<void> _onFilterButtonNavigateEvent(
      FilterButtonNavigateEvent event, Emitter<ArtState> emit) {
    emit(ArtFilterActionState());
  }
}

bool artFirstLoad = true;
final _oldPostList = <ArtData>[];
int _pageNumber = 1;


// class ArtBloc extends Bloc<ArtEvent, ArtState> {
//   ArtDeliveryService artService;
//   ArtBloc({required this.artService}) : super(ArtInitial()) {
//     on<InitialOrderEvent>(_onInitialOrderEvent);
//     on<FilterButtonNavigateEvent>(_onFilterButtonNavigateEvent);
//     on<SearchUserEvent>(_onSearchUserEvent);
//     on<FilterUserEvent>(_onFilterUserEvent);
//     // on<FilterViewSelectedEvent>(_onFilterViewSelectedEvent);
//   }

//   // Inisiate first data loading
//   FutureOr<void> _onInitialOrderEvent(
//       InitialOrderEvent event, Emitter<ArtState> emit) async {
//     if (_artDataStatus == false) {
//       emit(ArtLoadingState());
//       await Future.delayed(const Duration(seconds: 2));
//       emit(ArtLoadedSuccsesState(
//         artList: ArtData.artList
//             .map((e) => ArtModelOne(
//                 name: e['name'],
//                 avatar: e["avatar"],
//                 id: e["id"],
//                 email: e["email"],
//                 phone: e["phone"],
//                 country: e["country"],
//                 city: e["city"],
//                 price: e["price"],
//                 width: e["width"],
//                 height: e["hight"],
//                 color: e["color"],
//                 pano: e["pano"],
//                 description: e["description"],
//                 imageUrl: e["imageUrl"]))
//             .toList(),
//       ));

//       ArtLoadedSuccsesState curentState = state as ArtLoadedSuccsesState;
//       _oldPostList = curentState.artList;

//       _artDataStatus = true;
//     } else {
//       emit(ArtLoadedSuccsesState(artList: _oldPostList));
//     }
//   }

//   FutureOr<void> _onFilterButtonNavigateEvent(
//       FilterButtonNavigateEvent event, Emitter<ArtState> emit) {
//     emit(ArtFilterActionState());
//   }

//   FutureOr<void> _onSearchUserEvent(
//       SearchUserEvent event, Emitter<ArtState> emit) async {

//         try {
//          ArtModel loadedPostData = await artService.getArtList(1, 10, event.query);
//       emit(ArtLoadedSuccsesState(artList: []));
//     } on DioException {
//       // emit(AddPostFailedState());
//     } catch (e) {
//       rethrow;
//     }
//   }

//   FutureOr<void> _onFilterUserEvent(
//       FilterUserEvent event, Emitter<ArtState> emit) {
//     // filder post and get service needed
//     event.city;
//     event.country;

//     if (event.city.isNotEmpty || event.country.isNotEmpty) {
//       // emit(ArtFilterrSelectedState());

//       emit(ArtLoadedSuccsesState(
//         artList: ArtData.filteredList
//             .map((e) => ArtModelOne(
//                 name: e['name'],
//                 avatar: e["avatar"],
//                 id: e["id"],
//                 email: e["email"],
//                 phone: e["phone"],
//                 country: e["country"],
//                 city: e["city"],
//                 price: e["price"],
//                 width: e["width"],
//                 height: e["hight"],
//                 color: e["color"],
//                 pano: e["pano"],
//                 description: e["description"],
//                 imageUrl: e["imageUrl"]))
//             .toList(),
//       ));
//     } else {
//       emit(ArtLoadedSuccsesState(artList: _oldPostList));
//     }
//   }

//   // FutureOr<void> _onFilterViewSelectedEvent(
//   //     FilterViewSelectedEvent event, Emitter<ArtState> emit) {
//   //   emit(ArtLoadedSuccsesState(
//   //     artList: ArtData.filteredList
//   //         .map((e) => ArtModel(
//   //             name: e['name'],
//   //             avatar: e["avatar"],
//   //             id: e["id"],
//   //             email: e["email"],
//   //             phone: e["phone"],
//   //             country: e["country"],
//   //             city: e["city"],
//   //             price: e["price"],
//   //             width: e["width"],
//   //             height: e["hight"],
//   //             color: e["color"],
//   //             pano: e["pano"],
//   //             description: e["description"],
//   //             imageUrl: e["imageUrl"]))
//   //         .toList(),
//   //   ));
//   // }
// }

// bool _artDataStatus = false;
// var _oldPostList = <ArtModelOne>[];

// const apiUrl = "";

// final ArtDeliveryService service = ArtDeliveryService as ArtDeliveryService;
import 'dart:async';

import 'package:art_market/screens/art_page/data/art_data.dart';
import 'package:art_market/screens/art_page/model/order_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'art_event.dart';
part 'art_state.dart';

class ArtBloc extends Bloc<ArtEvent, ArtState> {
  ArtBloc() : super(ArtInitial()) {
    // Inisiate first data loading
    on<InitialOrderEvent>(_onInitialOrderEvent);
    on<FilterButtonNavigateEvent>(_onFilterButtonNavigateEvent);
  }

  // Inisiate first data loading
  FutureOr<void> _onInitialOrderEvent(
      InitialOrderEvent event, Emitter<ArtState> emit) async {
    // bool checkInitial = true;
    // if (checkInitial == true) {
      emit(OrderLoadingState());
      await Future.delayed(const Duration(seconds: 1));
      emit(OrderSuccsesState(
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
                hight: e["hight"],
                color: e["color"],
                pano: e["pano"],
                description: e["description"],
                imageUrl: e["imageUrl"]))
            .toList(),
      ));
    //   checkInitial = event.initiatePermission;
    //   print(checkInitial);
    // } else {
    //   print("object");
    //   return;
    // }
  }

  FutureOr<void> _onFilterButtonNavigateEvent(
      FilterButtonNavigateEvent event, Emitter<ArtState> emit) {
    emit(ArtFilterActionState());
  }
}

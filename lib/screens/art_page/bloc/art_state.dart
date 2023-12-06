part of 'art_bloc.dart';

abstract class ArtState {
}

// States - First data load
final class ArtInitial extends ArtState {}

class ArtLoadingState extends ArtState {}

class ArtLoadedSuccsesState extends ArtState {
  final List<ArtData> artList;
  ArtLoadedSuccsesState({required this.artList});
}

class ArtLoadErrorState extends ArtState {}

// Action when press filter button
abstract class ArtActionState extends ArtState {}

class ArtFilterActionState extends ArtActionState {}

class ArtFilterrSelectedState extends ArtActionState {}

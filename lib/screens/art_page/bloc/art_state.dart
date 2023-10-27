part of 'art_bloc.dart';

abstract class ArtState {
  // List<ArtModel> artList;

  // ArtState({this.artList = const []});
}

// States - First data load
final class ArtInitial extends ArtState {}

class ArtLoadingState extends ArtState {}

class ArtLoadedSuccsesState extends ArtState with EquatableMixin {
  final List<ArtModel> artList;

  ArtLoadedSuccsesState({required this.artList});

  @override
  List<Object?> get props => [];
}

class ArtLoadErrorState extends ArtState {}

// Action when press filter button
abstract class ArtActionState extends ArtState {}

class ArtFilterActionState extends ArtActionState {}

class ArtFilterrSelectedState extends ArtActionState {}
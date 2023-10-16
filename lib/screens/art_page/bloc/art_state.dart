part of 'art_bloc.dart';

abstract class ArtState {}

// States - First data load
final class ArtInitial extends ArtState {}

class OrderLoadingState extends ArtState {}

class OrderSuccsesState extends ArtState with EquatableMixin{
  final List<ArtModel> artList;

  OrderSuccsesState({required this.artList});
  
  @override
  List<Object?> get props => [];

}

class OrderErrorState extends ArtState {}

// Action when press filter button
abstract class ArtActionState extends ArtState {}
class ArtFilterActionState extends ArtActionState {}



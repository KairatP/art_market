part of 'art_bloc.dart';

@immutable
abstract class ArtEvent {}

// Inisiate first data loading
class InitialOrderEvent extends ArtEvent {}

class ArtPaginationEvent extends ArtEvent {
  final String searchText;
  final List<String> filterList;

  ArtPaginationEvent({required this.searchText, required this.filterList});
}

// Navigate to fillter view when press fillter button
class FilterButtonNavigateEvent extends ArtEvent {}

// search fill action
class SearchUserEvent extends ArtEvent {
  final String searchText;

  SearchUserEvent({required this.searchText});
}

class FilterUserEvent extends ArtEvent {
  final List<String> country;

  FilterUserEvent({required this.country});

  List<Object?> get props => [
        country,
      ];
}

class FilterViewSelectedEvent extends ArtEvent {}

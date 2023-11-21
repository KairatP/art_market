part of 'art_bloc.dart';

@immutable
abstract class ArtEvent {}

// Inisiate first data loading
class InitialOrderEvent extends ArtEvent {}

class ProfilePaginationEvent extends ArtEvent {
  final String searchText;

  ProfilePaginationEvent({required this.searchText});
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

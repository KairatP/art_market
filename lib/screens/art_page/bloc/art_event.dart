part of 'art_bloc.dart';

@immutable
abstract class ArtEvent {}

// Inisiate first data loading
class InitialOrderEvent extends ArtEvent {}

// Navigate to fillter view when press fillter button
class FilterButtonNavigateEvent extends ArtEvent {}

// search fill action
class SearchUserEvent extends ArtEvent {
  final String query;

  SearchUserEvent({required this.query});
}

class FilterUserEvent extends ArtEvent {
  final List<String> country;
  final List<String> city;

  FilterUserEvent({required this.country, required this.city});

  List<Object?> get props => 
      [country, 
      city, 
      ];


}

class FilterViewSelectedEvent extends ArtEvent {}
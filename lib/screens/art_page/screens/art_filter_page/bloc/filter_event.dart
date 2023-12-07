part of 'filter_bloc.dart';

abstract class FilterEvent {}
class FilterInitialEvent extends FilterEvent {}

class FilterCountryAddEvent extends FilterEvent {
  final String selectedCountry;
  FilterCountryAddEvent({required this.selectedCountry});
}

class FilterCountryDelateEvent extends FilterEvent {
  final String selectedCountry;
  FilterCountryDelateEvent({required this.selectedCountry});
}

class FilterCityAddEvent extends FilterEvent {
  final String selectedCity;
  FilterCityAddEvent({this.selectedCity = ''});
}

class FilterCityDelateEvent extends FilterEvent {
  final String selectedCity;
  FilterCityDelateEvent({this.selectedCity = ''});
}

class FilterSearchEvent extends FilterEvent {
  final String searchText;
  FilterSearchEvent({required this.searchText});
}

class FilterSelectedUpdateEvent extends FilterEvent {}

class FilterSelectedNavigateEvent extends FilterEvent {}
part of 'filter_bloc.dart';

abstract class FilterEvent {}
class FilterInitialEvent extends FilterEvent {}

class FilterCountryAddEvent extends FilterEvent {
  final String selectedCountry;
  FilterCountryAddEvent({this.selectedCountry = ''});
}

class FilterCountryDelateEvent extends FilterEvent {
  final String selectedCountry;
  FilterCountryDelateEvent({this.selectedCountry = ''});
}

class FilterCityAddEvent extends FilterEvent {
  final String selectedCity;
  FilterCityAddEvent({this.selectedCity = ''});
}

class FilterCityDelateEvent extends FilterEvent {
  final String selectedCity;
  FilterCityDelateEvent({this.selectedCity = ''});
}

class FilterSelectedUpdateEvent extends FilterEvent {}

class FilterSelectedNavigateEvent extends FilterEvent {}
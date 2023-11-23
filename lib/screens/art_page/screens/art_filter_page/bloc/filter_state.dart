part of 'filter_bloc.dart';

class FilterState {
  List<String> iniCountry;
  List<String> selectedCountry;
  FilterState({
    required this.iniCountry,
    required this.selectedCountry,
  });
}

class FilterInitial extends FilterState {
  FilterInitial()
      : super(
            iniCountry: [], selectedCountry: []);
}

abstract class FilterActionState extends FilterState {
  FilterActionState({required super.selectedCountry}): super(iniCountry: []);
}

class FilterSelectedActionState extends FilterActionState {
  FilterSelectedActionState({required super.selectedCountry});
}

class FilterLoadingState extends FilterState{
  FilterLoadingState({required super.selectedCountry, required super.iniCountry});
}

class FilterErrorState extends FilterState{
  FilterErrorState({required super.selectedCountry, required super.iniCountry});
}


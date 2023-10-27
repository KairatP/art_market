part of 'filter_bloc.dart';

class FilterState {
  List<String> iniCountry;
  List<String> iniCity;
  List<String> selectedCountry;
  List<String> selectedCity;

  FilterState({
    required this.iniCountry,
    required this.iniCity,
    required this.selectedCountry,
    required this.selectedCity,
  });

  List<Object?> get props => [
        iniCountry,
        iniCity,
        selectedCountry,
        selectedCity,
      ];
}

final class FilterInitial extends FilterState {
  FilterInitial()
      : super(
            iniCountry: [], iniCity: [], selectedCountry: [], selectedCity: []);
}

// class FilderSelectesItemsState extends FilterState {
//   final List<String> country;
//   final List<String> city;
//   final List<String> myCountry;
//   final List<String> myCity;

//   FilderSelectesItemsState({
//     this.country = const [],
//     this.city = const [],
//     this.myCountry = const [],
//     this.myCity = const [],
//     // required this.myCountry,
//     // required this.myCity
//   }): super(iniCountry: country, iniCity: city, selectedCountry: [], selectedCity: []);
//   @override
//   List<Object?> get props =>
//     [
//       country,
//       city,
//       myCountry,
//       myCity
//     ];
// }

abstract class FilterActionState extends FilterState {
  FilterActionState({required super.selectedCountry, required super.selectedCity}): super(iniCity: [],iniCountry: []);
}

class FilterSelectedActionState extends FilterActionState {
  FilterSelectedActionState({required super.selectedCountry, required super.selectedCity});
}

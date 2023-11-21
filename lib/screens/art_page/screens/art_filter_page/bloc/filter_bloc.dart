import 'dart:async';

import 'package:bloc/bloc.dart';

part 'filter_event.dart';
part 'filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  FilterBloc() : super(FilterInitial()) {
    on<FilterInitialEvent>(_onFilterInitialEvent);
    on<FilterCountryAddEvent>(_onFilterCountryAddEvent);
    on<FilterCountryDelateEvent>(_onFilterCountryDelateEvent);
    // on<FilterCityAddEvent>(_onFilterCityAddEvent);
    // on<FilterCityDelateEvent>(_onFilterCityDelateEvent);
    on<FilterSelectedNavigateEvent>(_onFilterSelectedNavigateEvent);
  }

  FutureOr<void> _onFilterInitialEvent(
      FilterInitialEvent event, Emitter<FilterState> emit) {
    if (myCountryList.isEmpty) {
      emit(FilterState(
          iniCountry: coutry,
          iniCity: city,
          selectedCountry: state.selectedCountry,
          selectedCity: state.selectedCity));
    } else {
      myCountryList.sort();
      emit(FilterState(
          iniCountry: coutry,
          iniCity: state.iniCity,
          selectedCountry: myCountryList,
          selectedCity: state.selectedCity));
    }
  }

  FutureOr<void> _onFilterCountryAddEvent(
      FilterCountryAddEvent event, Emitter<FilterState> emit) {
    state.selectedCountry.add(event.selectedCountry);
    state.selectedCountry.sort();
    // for (var element in state.selectedCountry) {
    //   state.iniCountry.remove(element);
    // }
    // state.iniCountry.insertAll(0, state.selectedCountry);
    state.iniCountry.remove(event.selectedCountry);
    emit(FilterState(
        iniCountry: state.iniCountry,
        iniCity: state.iniCity,
        selectedCountry: state.selectedCountry,
        selectedCity: state.selectedCity));
    myCountryList.add(event.selectedCountry);
    // myCountryList.sort();
  }

  FutureOr<void> _onFilterCountryDelateEvent(
      FilterCountryDelateEvent event, Emitter<FilterState> emit) {
    // state.iniCountry.removeRange(0, state.selectedCountry.length);
    state.iniCountry.add(event.selectedCountry);
    state.iniCountry.sort();
    state.selectedCountry.remove(event.selectedCountry);
    state.selectedCountry.sort();

    emit(FilterState(
        iniCountry: state.iniCountry,
        iniCity: state.iniCity,
        selectedCountry: state.selectedCountry,
        selectedCity: state.selectedCity));
    myCountryList.remove(event.selectedCountry);
  }

  // FutureOr<void> _onFilterCityAddEvent(
  //     FilterCityAddEvent event, Emitter<FilterState> emit) {
  //   state.selectedCity.add(event.selectedCity);
  //   state.selectedCity.sort();
  //   for (var element in state.selectedCity) {
  //     state.iniCity.remove(element);
  //   }
  //   state.iniCity.insertAll(0, state.selectedCity);
  //   emit(FilterState(
  //     iniCountry: state.iniCountry,
  //     iniCity: state.iniCity,
  //     selectedCountry: state.selectedCountry,
  //     selectedCity: state.selectedCity,
  //   ));
  // }

  // FutureOr<void> _onFilterCityDelateEvent(
  //     FilterCityDelateEvent event, Emitter<FilterState> emit) {
  //   state.iniCity.removeRange(0, state.selectedCity.length);
  //   state.iniCity.add(event.selectedCity);
  //   state.iniCity.sort();
  //   state.selectedCity.remove(event.selectedCity);
  //   state.selectedCity.sort();
  //   state.iniCity.insertAll(0, state.selectedCity);
  //   emit(FilterState(
  //     iniCountry: state.iniCountry,
  //     iniCity: state.iniCity,
  //     selectedCountry: state.selectedCountry,
  //     selectedCity: state.selectedCity,
  //   ));
  // }

  FutureOr<void> _onFilterSelectedNavigateEvent(
      FilterSelectedNavigateEvent event, Emitter<FilterState> emit) {
    emit(FilterSelectedActionState(
        selectedCountry: state.selectedCountry,
        selectedCity: state.selectedCity));
  }

  // FutureOr<void> _onFilterSelectedUpdateEvent(
  //     FilterSelectedUpdateEvent event, Emitter<FilterState> emit) {
  //   emit(FilterState());
  // }
}

List<String> myCountryList = [];

var coutry = [
  "Afghanistan",
  "Albania",
  "Algeria",
  "Andorra",
  "Angola",
  "Antigua and Barbuda",
  "Argentina",
  "Armenia",
  "Australia",
  "Austria",
  "Azerbaijan",
  "The Bahamas",
  "Bahrain",
  "Bangladesh",
  "Barbados",
  "Belarus",
  "Belgium",
  "Belize",
  "Benin",
  "Bhutan",
  "Bolivia",
  "Bosnia and Herzegovina",
  "Botswana",
  "Brazil",
  "Brunei",
  "Bulgaria",
  "Burkina Faso",
  "Burundi",
  "Cabo Verde",
  "Cambodia",
  "Cameroon",
  "Canada",
  "Central African Republic",
  "Chad",
  "Chile",
  "China",
  "Colombia",
  "Comoros",
  "Congo, Democratic Republic of the",
  "Congo, Republic of the",
  "Costa Rica",
  "Côte d’Ivoire",
  "Croatia",
  "Cuba",
  "Cyprus",
  "Czech Republic",
  "Denmark",
  "Djibouti",
  "Dominica",
  "Dominican Republic",
  "East Timor (Timor-Leste)",
  "Ecuador",
  "Egypt",
  "El Salvador",
  "Equatorial Guinea",
  "Eritrea",
  "Estonia",
  "Eswatini",
  "Ethiopia",
  "Fiji",
  "Finland",
  "France",
  "Gabon",
  "The Gambia",
  "Georgia",
  "Germany",
  "Ghana",
  "Greece",
  "Grenada",
  "Guatemala",
  "Guinea",
  "Guinea-Bissau",
  "Guyana",
  "Haiti",
  "Honduras",
  "Hungary",
  "Iceland",
  "India",
  "Indonesia",
  "Iran",
  "Iraq",
  "Ireland",
  "Israel",
  "Italy",
  "Jamaica",
  "Japan",
  "Jordan",
  "Kazakhstan",
  "Kenya",
  "Kiribati",
  "Korea, North",
  "Korea, South",
  "Kosovo",
  "Kuwait",
  "Kyrgyzstan",
  "Laos",
  "Latvia",
  "Lebanon",
  "Lesotho",
  "Liberia",
  "Libya",
  "Liechtenstein",
  "Lithuania",
  "Luxembourg",
  "Madagascar",
  "Malawi",
  "Malaysia",
  "Maldives",
  "Mali",
  "Malta",
  "Marshall Islands",
  "Mauritania",
  "Mauritius",
  "Mexico",
  "Micronesia, Federated States of",
  "Moldova",
  "Monaco",
  "Mongolia",
  "Montenegro",
  "Morocco",
  "Mozambique",
  "Myanmar (Burma)",
  "Namibia",
  "Nauru",
  "Nepal",
  "Netherlands",
  "New Zealand",
  "Nicaragua",
  "Niger",
  "Nigeria",
  "North Macedonia",
  "Norway",
  "Oman",
  "Pakistan",
  "Palau",
  "Panama",
  "Papua New Guinea",
  "Paraguay",
  "Peru",
  "Philippines",
  "Poland",
  "Portugal",
  "Qatar",
  "Romania",
  "Russia",
  "Rwanda",
  "Saint Kitts and Nevis",
  "Saint Lucia",
  "Saint Vincent and the Grenadines",
  "Samoa",
  "San Marino",
  "Sao Tome and Principe",
  "Saudi Arabia",
  "Senegal",
  "Serbia",
  "Seychelles",
  "Sierra Leone",
  "Singapore",
  "Slovakia",
  "Slovenia",
  "Solomon Islands",
  "Somalia",
  "South Africa",
  "Spain",
  "Sri Lanka",
  "Sudan",
  "Sudan, South",
  "Suriname",
  "Sweden",
  "Switzerland",
  "Syria",
  "Taiwan",
  "Tajikistan",
  "Tanzania",
  "Thailand",
  "Togo",
  "Tonga",
  "Trinidad and Tobago",
  "Tunisia",
  "Turkey",
  "Turkmenistan",
  "Tuvalu",
  "Uganda",
  "Ukraine",
  "United Arab Emirates",
  "United Kingdom",
  "United States",
  "Uruguay",
  "Uzbekistan",
  "Vanuatu",
  "Vatican City",
  "Venezuela",
  "Vietnam",
  "Yemen",
  "Zambia",
  "Zimbabwe",
];
var city = [
  'Newyork',
  'Astana',
  'Ankara',
  'Berlin',
  'Istanbul',
  'Buzzz',
  'Kepitttt',
  'Abai',
  'Almaty',
  'Cincinaty',
  'Boston',
  'London',
  'York',
  'Shir',
  'Dubai',
  'Dublin',
  'Bern',
  'Keln',
  'Rashtat',
  'Milan',
  'Rome',
  'Monaco',
  'Nice',
  'Parice'
];

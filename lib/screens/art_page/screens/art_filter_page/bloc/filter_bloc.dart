import 'dart:async';

import 'package:bloc/bloc.dart';

part 'filter_event.dart';
part 'filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  FilterBloc() : super(FilterInitial()) {
    on<FilterInitialEvent>(_onFilterInitialEvent);
    on<FilterCountryAddEvent>(_onFilterCountryAddEvent);
    on<FilterCountryDelateEvent>(_onFilterCountryDelateEvent);
    on<FilterCityAddEvent>(_onFilterCityAddEvent);
    on<FilterCityDelateEvent>(_onFilterCityDelateEvent);
    on<FilterSelectedNavigateEvent>(_onFilterSelectedNavigateEvent);
    // on<FilterSelectedUpdateEvent>(_onFilterSelectedUpdateEvent);
  }

  FutureOr<void> _onFilterInitialEvent(
      FilterInitialEvent event, Emitter<FilterState> emit) {
    if (_country.isEmpty|| _city.isEmpty) {
      _city = city;
      _country = coutry;
      emit(FilterState(
          iniCountry: _country,
          iniCity: _city,
          selectedCountry: _selectedCountry,
          selectedCity: _selectedCity));
    } else {
      emit(FilterState(
          iniCountry: _country,
          iniCity: _city,
          selectedCountry: _selectedCountry,
          selectedCity: _selectedCity));
    }
  }

  FutureOr<void> _onFilterCountryAddEvent(
      FilterCountryAddEvent event, Emitter<FilterState> emit) {
    _selectedCountry.add(event.selectedCountry);

    emit(FilterState(
        iniCountry: _country,
        iniCity: _city,
        selectedCountry: _selectedCountry,
        selectedCity: _selectedCity));
  }

  FutureOr<void> _onFilterCountryDelateEvent(
      FilterCountryDelateEvent event, Emitter<FilterState> emit) {
    _selectedCountry.remove(event.selectedCountry);
    emit(FilterState(
        iniCountry: _country,
        iniCity: _city,
        selectedCountry: _selectedCountry,
        selectedCity: _selectedCity));
  }

  FutureOr<void> _onFilterCityAddEvent(
      FilterCityAddEvent event, Emitter<FilterState> emit) {
    _selectedCity.add(event.selectedCity);
    emit(FilterState(
        iniCountry: _country,
        iniCity: _city,
        selectedCountry: _selectedCountry,
        selectedCity: _selectedCity));
  }

  FutureOr<void> _onFilterCityDelateEvent(
      FilterCityDelateEvent event, Emitter<FilterState> emit) {
    _selectedCity.remove(event.selectedCity);
    emit(FilterState(
        iniCountry: _country,
        iniCity: _city,
        selectedCountry: _selectedCountry,
        selectedCity: _selectedCity));
  }

  FutureOr<void> _onFilterSelectedNavigateEvent(
      FilterSelectedNavigateEvent event, Emitter<FilterState> emit) {
    emit(FilterSelectedActionState(selectedCountry: _selectedCountry, selectedCity: _selectedCity));
  }

  // FutureOr<void> _onFilterSelectedUpdateEvent(
  //     FilterSelectedUpdateEvent event, Emitter<FilterState> emit) {
  //   emit(FilterState());
  // }
}

List<String> _country = [];
List<String>  _city = [];
List<String>  _selectedCountry = [];
List<String>  _selectedCity = [];

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
  '1',
  '2',
  '3',
  '4',
  '5',
  '7',
  '8',
  '12',
  '11',
  '13',
  '44',
  '55',
  '75',
  '77',
  '888',
  '134354636467777878',
  '11111§',
  '222',
  '22',
  '111',
  '12211',
  '1212',
  '34',
  '545'
];

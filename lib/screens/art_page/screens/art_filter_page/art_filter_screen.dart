import 'package:art_market/constance/colors.dart';
import 'package:art_market/screens/art_page/bloc/art_bloc.dart';
import 'package:art_market/screens/art_page/screens/art_filter_page/bloc/filter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArtFilterPage extends StatefulWidget {
  const ArtFilterPage({Key? key, required this.bloc}) : super(key: key);

  final ArtBloc bloc;

  @override
  State<ArtFilterPage> createState() => _ArtFilterPageState();
}

class _ArtFilterPageState extends State<ArtFilterPage> {
  final FilterBloc filterBloc = FilterBloc();
  @override
  void initState() {
    filterBloc.add(FilterInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FilterBloc, FilterState>(
      bloc: filterBloc,
      listenWhen: (previous, curent) => curent is FilterActionState,
      buildWhen: (previous, curent) => curent is! FilterActionState,
      listener: (BuildContext context, FilterState state) {
        if (state is FilterSelectedActionState) {
          // Navigator.of(context).pushNamedAndRemoveUntil(
          //     RouterStructure.tabBar, (Route<dynamic> route) => false);
          // context
          //     .read<ArtBloc>()
          //     .add(FilterUserEvent(city: cityList, country: countryList));

          Navigator.pop(context);
          widget.bloc.add(FilterUserEvent(
              country: state.selectedCountry));

          // BlocProvider.of<ArtBloc>(context)
          //     .add(FilterUserEvent(city: cityList, country: cityList));
          // Navigator.pop(context);
        }
      },
      builder: (BuildContext context, FilterState state) {
        switch (state.runtimeType) {
          case FilterState:
            // final filterState = state as FilderSelectesItemsState;
            return Scaffold(
                backgroundColor: AppColors.whiteColor,
                appBar: AppBar(
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      filterBloc.add(FilterSelectedNavigateEvent());
                    }
                  ),
                  title: const Text("Filter"),
                  backgroundColor: AppColors.whiteColor,
                ),
                body: Center(
                    child: Column(
                  children: [
                    state.selectedCountry.isEmpty ? 
                    const SizedBox()
                    :
                    const Text("Seclected country:"),
                    state.selectedCountry.isEmpty ? 
                    const SizedBox() 
                    :
                    Expanded(
                      flex: 1,
                      child: ListView(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, bottom: 10),
                        children: [
                          Wrap(
                            spacing: 10,
                            children: state.selectedCountry
                                .map((e) => FilterChip(
                                      label: Text(e),
                                      selected: state.selectedCountry.contains(e),
                                      onSelected: (selected) {
                                        // if (selected) {
                                          // state.selectedCity.add(e);
                                          // filterBloc.add(FilterCityAddEvent(
                                          //     selectedCity: e));
                                        // } else {
                                        //   // state.selectedCity.remove(e);
                                          filterBloc.add(FilterCountryDelateEvent(
                                              selectedCountry: e));
                                        // }
                                      },
                                    ))
                                .toList(),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("Country:"),
                    Expanded(
                      flex: 5,
                      child: ListView(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        children: [
                          Wrap(
                            spacing: 10,
                            children: state.iniCountry
                                .map((e) => FilterChip(
                                      // selected:
                                      //     state.selectedCountry.contains(e),
                                      label: Text(e),
                                      onSelected: (selected) {
                                        // if (selected) {
                                          // state.selectedCountry.add(e);
                                          filterBloc.add(FilterCountryAddEvent(
                                              selectedCountry: e));
                                          // print(countryList);
                                        // } else {
                                        //   // state.selectedCountry.remove(e);
                                        //   filterBloc.add(
                                        //       FilterCountryDelateEvent(
                                        //           selectedCountry: e));
                                        //   // print(cityList);
                                        // }
                                      },
                                    ))
                                .toList(),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                )));
          default:
            return const SizedBox();
        }
      },
    );
  }
}

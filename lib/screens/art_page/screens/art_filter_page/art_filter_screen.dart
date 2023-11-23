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
          Navigator.pop(context, state.selectedCountry);
          if (state.selectedCountry.isEmpty) {
            artFirstLoad = true;
            widget.bloc.add(InitialOrderEvent());
          } else {
            widget.bloc.add(FilterUserEvent(
              country: state.selectedCountry));
          }
          
        }
      },
      builder: (BuildContext context, FilterState state) {
        switch (state.runtimeType) {
          case FilterLoadingState:
          return const Center(
                  child: CircularProgressIndicator(
                color: AppColors.mainColor,
              ));

          case FilterState:
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
                    const SizedBox(height: 10,),
                    const Text("Country:"),
                    const SizedBox(height: 10,),
                    Expanded(
                      // flex: 5,
                      child: ListView(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        children: [
                          Wrap(
                            spacing: 10,
                            children: state.iniCountry
                                .map((e) => FilterChip(
                                      selected:
                                          state.selectedCountry.contains(e),
                                      label: Text(e),
                                      onSelected: (selected) {
                                        if (selected) {
                                          filterBloc.add(FilterCountryAddEvent(
                                              selectedCountry: e));
                                        } else {
                                          filterBloc.add(
                                              FilterCountryDelateEvent(
                                                  selectedCountry: e));
                                        }
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

import 'package:art_market/constance/colors.dart';
import 'package:art_market/dependencies/injection_container.dart';
import 'package:art_market/router/router_structure.dart';
import 'package:art_market/screens/art_page/bloc/art_bloc.dart';
import 'package:art_market/screens/art_page/widget/art_app_bar.dart';
import 'package:art_market/screens/art_page/widget/art_cell.dart';
import 'package:art_market/screens/art_page/widget/serch_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArtPage extends StatefulWidget {
  const ArtPage({Key? key}) : super(key: key);

  @override
  State<ArtPage> createState() => _ArtPageState();
}

class _ArtPageState extends State<ArtPage> {
  final ArtBloc artBloc = ArtBloc(artService: getIt());

  @override
  void dispose() {
    artScrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    artBloc.add(InitialOrderEvent());
    setupController();
    super.initState();
  }

  var text = '';
  List<String> myCountryList = [];

  final artScrollController = ScrollController();
  void setupController() {
    artScrollController.addListener(() {
      if (artScrollController.position.atEdge) {
        if (artScrollController.position.pixels != 0) {
          artBloc.add(
              ArtPaginationEvent(searchText: text, filterList: myCountryList));
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ArtBloc, ArtState>(
      bloc: artBloc,
      listenWhen: (previous, curent) => curent is ArtActionState,
      buildWhen: (previous, curent) => curent is! ArtActionState,
      listener: (context, state) {
        if (state is ArtFilterActionState) {
          Navigator.pushNamed(context, RouterStructure.artFilter,
                  arguments: artBloc)
              .then((Object? value) {
            // Handle the result when the artFilter screen is popped
            if (value != null && value is List<String>) {
              myCountryList = value;
            } else if (value == null) {
              myCountryList = [];
            }
          });
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case ArtLoadingState:
            return const Scaffold(
                body: Center(
                    child: CircularProgressIndicator(
              color: AppColors.mainColor,
            )));

          case ArtLoadedSuccsesState:
            final successState = state as ArtLoadedSuccsesState;
            return Scaffold(
              appBar: artAppBar(context, artBloc),
              body: Column(
                children: [
                  Container(
                      //Search
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 10),
                      color: AppColors.transparentColor,
                      child: SearchFieald(
                        lableText: "Search",
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Image.asset('assets/icons/search.png'),
                        ),
                        onChanged: (value) {
                          // Call bloc event for search
                          text = value;
                          artBloc.add(SearchUserEvent(searchText: value));
                        },
                      )),
                  successState.artList.isEmpty
                      ? const Center(
                          child: Text("No posts"),
                        )
                      : Expanded(
                          // List view
                          child: ListView.separated(
                              controller: artScrollController,
                              itemCount: successState.artList.length,
                              shrinkWrap: true,
                              // physics: NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.zero,
                              itemBuilder: (context, index) {
                                return ArtCell(
                                  artModelType: successState.artList[index],
                                  index: index,
                                );
                              },
                              separatorBuilder: (context, index) {
                                return const Divider();
                              })),
                ],
              ),
            );
          case ArtLoadErrorState:
            return const Scaffold(
              body: Center(
                child: Text("Error"),
              ),
            );
          default:
            return const SizedBox();
        }
      },
    );
    // );
  }
}

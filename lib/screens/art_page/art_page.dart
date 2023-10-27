import 'package:art_market/constance/colors.dart';
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
  final ArtBloc artBloc = ArtBloc();

  @override
  void initState() {
    artBloc.add(InitialOrderEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // BlocProvider.of<ArtBloc>(context).
    return BlocConsumer<ArtBloc, ArtState>(
      bloc: artBloc,
      listenWhen: (previous, curent) => curent is ArtActionState,
      buildWhen: (previous, curent) => curent is! ArtActionState,
      // listenWhen: (previous, curent) {
      //   return true;
      // },
      // buildWhen: (previous, curent) {
      //   return true;
      // },
      listener: (context, state) {
        if (state is ArtFilterActionState) {
          // List<List<String>>? myFilterData =
          Navigator.pushNamed(context, RouterStructure.artFilter,
                  arguments: artBloc);
          // if (myFilterData!.isNotEmpty) {
          //   artBloc.add(FilterUserEvent(
          //       city: myFilterData.last, country: myFilterData.first));
          // }
        }
        // if (state is ArtFilterrSelectedState) {
        //   artBloc.add(FilterViewSelectedEvent());
        // }
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
                          artBloc.add(SearchUserEvent(query: value));
                        },
                      )),
                  Expanded(
                      // List view
                      child: ListView.separated(
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

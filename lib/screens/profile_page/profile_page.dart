import 'package:art_market/constance/colors.dart';
import 'package:art_market/dependencies/injection_container.dart';
import 'package:art_market/screens/profile_page/bloc/profile_bloc.dart';
import 'package:art_market/screens/profile_page/widgets/profile_app_bar.dart';
import 'package:art_market/screens/profile_page/widgets/profile_cell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final ProfileBloc profileBloc = ProfileBloc(postService: getIt());

  @override
  void initState() {
    profileBloc.add(InitialProfileEvent());
    setupController();
    super.initState();
  }

  final scrollController = ScrollController();
  void setupController() {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          profileBloc.add(ProfileLoadedEvent());
        }
      }
    });
  }

  // late final IAuthor author;

  @override
  Widget build(BuildContext context) {
    // BlocProvider.of<ArtBloc>(context).
    return BlocConsumer<ProfileBloc, ProfileState>(
      bloc: profileBloc,
      listenWhen: (previous, curent) => curent is ProfileActionState,
      buildWhen: (previous, curent) => curent is! ProfileActionState,
      listener: (context, state) {},
      builder: (context, state) {
        switch (state.runtimeType) {
          case ProfileLoadingState:
            return const Scaffold(
                body: Center(
                    child: CircularProgressIndicator(
              color: AppColors.mainColor,
            )));

          case ProfilePostListSuccsesState:
            final successState = state as ProfilePostListSuccsesState;
            return Scaffold(
              appBar:
                  profileAppBar(context, successState.profileUserData, (value) {
                if (value == 'ok') {
                  profileBloc.add(InitialProfileEvent());
                }
              }, (valueAddPost) {
                if (valueAddPost == 'ok') {
                  profileBloc.add(InitialProfileEvent());
                }
              }),
              body: successState.postList.isEmpty
                  ? const Center(
                      child: Text("No published posts yet"),
                    )
                  : Column(
                      children: [
                        Expanded(
                            // List view
                            child: ListView.separated(
                                controller: scrollController,
                                itemCount: successState.postList.length,
                                shrinkWrap: true,
                                // physics: NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.zero,
                                itemBuilder: (context, index) {
                                  return ProfileCell(
                                    profileModelType:
                                        successState.postList[index],
                                    index: index,
                                    updatePost: (updatePostText) {
                                      profileBloc.add(InitialProfileEvent());
                                    },
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return const Divider();
                                })),
                      ],
                    ),
            );
          case ProfilePostErrorState:
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

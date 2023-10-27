import 'package:art_market/constance/colors.dart';
import 'package:art_market/router/router_structure.dart';
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
  final ProfileBloc profileBloc = ProfileBloc();

  @override
  void initState() {
    profileBloc.add(InitialProfileEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // BlocProvider.of<ArtBloc>(context).
    return BlocConsumer<ProfileBloc, ProfileState>(
      bloc: profileBloc,
      listenWhen: (previous, curent) => curent is ProfileActionState,
      buildWhen: (previous, curent) => curent is! ProfileActionState,
      listener: (context, state) {
        if (state is AddPostActionState) {
          Navigator.pushNamed(context, RouterStructure.addPostPage);
        } else if (state is ProfileEditActionState) {
          Navigator.pushNamed(context, RouterStructure.profileEditPage);
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case ProfileInitial:
            return const Scaffold(
                body: Center(
                    child: CircularProgressIndicator(
              color: AppColors.mainColor,
            )));

          case ProfilePostListSuccsesState:
            final successState = state as ProfilePostListSuccsesState;
            return Scaffold(
              appBar:
                  profileAppBar(context, profileBloc, state.profileUserData),
              body: successState.postList.isEmpty ? const SizedBox() :
              Column(
                children: [
                  Expanded(
                      // List view
                      child: ListView.separated(
                          itemCount: successState.postList.length,
                          shrinkWrap: true,
                          // physics: NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) {
                            return ProfileCell(
                              profileModelType: successState.postList[index],
                              index: index,
                              userData: state.profileUserData,
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

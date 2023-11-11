import 'package:art_market/router/router_structure.dart';
import 'package:art_market/screens/art_page/bloc/art_bloc.dart';
import 'package:art_market/screens/art_page/screens/art_detail_page/art_detail.dart';
import 'package:art_market/screens/art_page/model/art_model.dart';
import 'package:art_market/screens/art_page/screens/art_filter_page/art_filter_screen.dart';
import 'package:art_market/screens/profile_page/screens/add_post/add_post_page.dart';
import 'package:art_market/screens/profile_page/screens/add_post/bloc/add_post_bloc.dart';
import 'package:art_market/screens/profile_page/screens/edit_my_post_page/bloc/edit_post_bloc.dart';
import 'package:art_market/screens/profile_page/screens/edit_my_post_page/edit_post_page.dart';
import 'package:art_market/screens/profile_page/screens/profile_edit_page/bloc/profile_edit_bloc.dart';
import 'package:art_market/screens/profile_page/screens/profile_edit_page/profile_edit_page.dart';
import 'package:art_market/screens/tab_bar/tab_bar.dart';
import 'package:art_market/screens/welcome_page/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MetaRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RouterStructure.tabBar:
        // bool args = routeSettings.arguments as bool;
        return MaterialPageRoute(
          builder: (context) => const MyTabBar(),
          settings: routeSettings,
        );
      case RouterStructure.welcome:
        return MaterialPageRoute(
          builder: (context) => const WelcomePage(),
          settings: routeSettings,
        );
      case RouterStructure.artDetail:
        ArtModel args = routeSettings.arguments as ArtModel;
        return MaterialPageRoute(
          builder: (context) => ArtDetail(
            artModelType: args,
          ),
          settings: routeSettings,
        );
      case RouterStructure.artFilter:
        ArtBloc args = routeSettings.arguments as ArtBloc;
        return MaterialPageRoute(
          builder: (context) => ArtFilterPage(bloc: args),
          settings: routeSettings,
        );
      // case RouterStructure.addPostPage:
      // return MaterialPageRoute(
      //   builder: (context) => const AddPostPage(),
      //   settings: routeSettings,
      // );
      case RouterStructure.addPostPage:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => AddPostBloc(),
            child: const AddPostPage(),
          ),
          settings: routeSettings,
        );
      case RouterStructure.editPostPage:
        EditPostPage args = routeSettings.arguments as EditPostPage;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => EditPostBloc(),
            child: EditPostPage(
              postModelType: args.postModelType,
              userModelType: args.userModelType,
            ),
          ),
          settings: routeSettings,
        );
      case RouterStructure.profileEditPage:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => ProfileEditBloc(),
            child: const ProfileEditPage(),
          ),
          settings: routeSettings,
        );
    }
    return null;
  }
}

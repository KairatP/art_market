import 'package:art_market/dependencies/injection_container.dart';
import 'package:art_market/model/art/my_art_model.dart';
import 'package:art_market/model/user/user_profile_model.dart';
import 'package:art_market/router/router_structure.dart';
import 'package:art_market/screens/art_page/bloc/art_bloc.dart';
import 'package:art_market/screens/art_page/screens/art_detail_page/art_detail.dart';
import 'package:art_market/model/art/art_model.dart';
import 'package:art_market/screens/art_page/screens/art_filter_page/art_filter_screen.dart';
import 'package:art_market/screens/profile_page/bloc/profile_bloc.dart';
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

// class MetaRouter {
//   static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
//     switch (routeSettings.name) {
//       case RouterStructure.tabBar:
//         // bool args = routeSettings.arguments as bool;
//         return MaterialPageRoute(
//           builder: (context) => const MyTabBar(),
//           settings: routeSettings,
//         );
//       case RouterStructure.welcome:
//         return MaterialPageRoute(
//           builder: (context) => const WelcomePage(),
//           settings: routeSettings,
//         );
//       case RouterStructure.artDetail:
//         ArtData args = routeSettings.arguments as ArtData;
//         return MaterialPageRoute(
//           builder: (context) => ArtDetail(
//             artModelType: args,
//           ),
//           settings: routeSettings,
//         );
//       case RouterStructure.artFilter:
//         ArtBloc args = routeSettings.arguments as ArtBloc;
//         return MaterialPageRoute(
//           builder: (context) => ArtFilterPage(bloc: args),
//           settings: routeSettings,
//         );
//       // case RouterStructure.addPostPage:
//       // return MaterialPageRoute(
//       //   builder: (context) => const AddPostPage(),
//       //   settings: routeSettings,
//       // );
//       case RouterStructure.addPostPage:
//       // IAuthor args = routeSettings.arguments as IAuthor;
//         return MaterialPageRoute(
//           builder: (context) => BlocProvider(
//             create: (context) => AddPostBloc(postService: getIt())..add(InitialAddPostEvent()),
//             child: const AddPostPage(),
//           ),
//           settings: routeSettings,
//         );
        
//       case RouterStructure.editPostPage:
//         MyArtData args = routeSettings.arguments as MyArtData;
//         return MaterialPageRoute(
//           builder: (context) => BlocProvider(
//             create: (context) => EditPostBloc(postService: getIt(), userPost: args)..add(EditPosInitialEvent()),
//             child: const EditPostPage(),
//           ),
//           settings: routeSettings,
//         );

//       case RouterStructure.profileEditPage:
//       UserProfileModel args = routeSettings.arguments as UserProfileModel;
 

//         return MaterialPageRoute(
//           builder: (context) => BlocProvider(
//             create: (context) => ProfileEditBloc(postService: getIt(), userProfile: args)..add(InitialEditProfileEvent()),
//             child: const ProfileEditPage(),
//           ),
//           settings: routeSettings,
//         );
//     }
//     return null;
//   }
// }





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
        ArtData args = routeSettings.arguments as ArtData;
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
          builder: (context) => 
          // BlocProvider(create: (context) => AddPostBloc(postService: getIt()),

          MultiBlocProvider(
            providers: [
              // BlocProvider(
              //     create: (context) => AddPostBloc(postService: getIt())
              //     // ..add(InitialAddPostEvent()),
              //     ),
              // BlocProvider(
              //   create: (context) => ProfileBloc(postService: getIt()),
              // ),
              BlocProvider.value(
                  value: AddPostBloc(postService: getIt())
                  ),
              BlocProvider.value(
                value: ProfileBloc(postService: getIt()),
              ),
            ],
            child: const AddPostPage(),
          ),
          settings: routeSettings,
        );

      case RouterStructure.editPostPage:
        MyArtData args = routeSettings.arguments as MyArtData;
        return MaterialPageRoute(
          builder: (context) => 
          // BlocProvider(
          //       create: (context) => EditPostBloc(postService: getIt(), userPost: args),
          MultiBlocProvider(
            providers: [
              BlocProvider.value(
                value: EditPostBloc(postService: getIt(), userPost: args),
              ),
              // BlocProvider(
              //   create: (context) => EditPostBloc(postService: getIt(), userPost: args),
              // ),
              // BlocProvider(
              //   create: (context) => ProfileBloc(postService: getIt()),
              // ),
              BlocProvider.value(
                value: ProfileBloc(postService: getIt()),
              ),
            ],
            child: const EditPostPage(),
          ),
          settings: routeSettings,
        );

      case RouterStructure.profileEditPage:
        UserProfileModel args = routeSettings.arguments as UserProfileModel;
        return MaterialPageRoute(
          builder: (context) => 
          // BlocProvider(create: (context) => ProfileEditBloc(postService: getIt(), userProfile: args),
          MultiBlocProvider(
            providers: [
              BlocProvider.value(
                value: ProfileEditBloc(postService: getIt(), userProfile: args),
              ),
              // BlocProvider(
              //   create: (context) =>
              //       ProfileEditBloc(postService: getIt(), userProfile: args),
              // ),
              // BlocProvider(
              //   create: (context) => ProfileBloc(postService: getIt()),
              // ),
              BlocProvider.value(
                value: ProfileBloc(postService: getIt()),
              ),
            ],
            child: const ProfileEditPage(),
          ),
          settings: routeSettings,
        );
    }
    return null;
  }
}

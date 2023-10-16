import 'package:art_market/router/router_structure.dart';
import 'package:art_market/screens/art_detail/art_detail.dart';
import 'package:art_market/screens/art_page/model/order_model.dart';
import 'package:art_market/screens/art_page/widget/art_filter.dart';
import 'package:art_market/screens/profile_page/profile.dart';
import 'package:art_market/screens/tab_bar/tab_bar.dart';
import 'package:art_market/screens/welcome_page/welcome_page.dart';
import 'package:flutter/material.dart';

class MetaRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RouterStructure.tabBar:
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
        return MaterialPageRoute(
          builder: (context) => const ArtFilter(),
          settings: routeSettings,
        );
        case RouterStructure.profile:
        return MaterialPageRoute(
          builder: (context) => const Profile(),
          settings: routeSettings,
        );
    }
    return null;
  }
}

import 'package:animations/animations.dart';
import 'package:art_market/constance/colors.dart';
import 'package:art_market/dependencies/injection_container.dart';
import 'package:art_market/screens/art_page/art_page.dart';
import 'package:art_market/screens/auth/auth_page.dart';
import 'package:art_market/screens/profile_page/bloc/profile_bloc.dart';
import 'package:art_market/screens/profile_page/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class MyTabBar extends StatefulWidget {
  const MyTabBar({Key? key}) : super(key: key);

  @override
  State<MyTabBar> createState() => _TabBarState();
}

class _TabBarState extends State<MyTabBar> {
  @override
  void initState() {
    // String? access = tokensBox.get('access');
    super.initState();
  }

  int selectedIndex = 0;
  final pages = [
    const ArtPage(),
    // ProfilePage()
    BlocProvider(
      create: (context) => ProfileBloc(postService: getIt()),
      child: const ProfilePage(),
    )
  ];
  final page = [const ArtPage(), const AuthScreen()];

  Box tokensBox = Hive.box('tokens');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageTransitionSwitcher(
          duration: const Duration(milliseconds: 700),
          transitionBuilder: (child, animation, secondaryAnimation) =>
              FadeThroughTransition(
                  animation: CurvedAnimation(
                      parent: animation,
                      curve: Curves.linearToEaseOut,
                      reverseCurve: Curves.easeInToLinear),
                  secondaryAnimation: secondaryAnimation,
                  child: child),
          child: tokensBox.isNotEmpty
              ? pages[selectedIndex]
              : page[selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: AppColors.whiteColor,
          unselectedItemColor: AppColors.greyColor,
          selectedItemColor: AppColors.mainColor,
          currentIndex: selectedIndex,
          onTap: (int index) {
            setState(() {
              selectedIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.image,
                size: 30.0,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
                size: 30.0,
              ),
              label: "Profile",
            )
          ]),
    );
  }
}

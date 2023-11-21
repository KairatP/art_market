import 'package:art_market/constance/colors.dart';
import 'package:art_market/screens/art_page/art_page.dart';
import 'package:art_market/screens/auth/auth_page.dart';
import 'package:flutter/material.dart';

class MyTabBar extends StatefulWidget {
  const MyTabBar({Key? key}) : super(key: key);

  @override
  State<MyTabBar> createState() => _TabBarState();
}

class _TabBarState extends State<MyTabBar> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Builder(
            builder: (context) {
              switch (selectedIndex) {
                case 0:
                  return const ArtPage();
                case 1:
                  return const AuthScreen();
                default:
                  return const Center(
                      child: Text(
                          'Something has been went wrong, please contact with admin'));
              }
              // return Container();
            },
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 90,
        child: NavigationBar(
          backgroundColor: AppColors.mainColor,
          onDestinationSelected: (int index) {
            setState(() {
              selectedIndex = index;
            });
          },
          indicatorColor: Colors.transparent,
          selectedIndex: selectedIndex,
          destinations: const <Widget>[
            NavigationDestination(
              selectedIcon: Icon(
                Icons.image,
                color: AppColors.whiteColor,
                size: 30.0,
              ),
              icon: Icon(
                Icons.image_outlined,
                color: AppColors.greyColor,
                size: 30.0,
              ),
              label: 'Home',
            ),
            NavigationDestination(
              selectedIcon: Icon(
                Icons.account_circle,
                color: AppColors.whiteColor,
                size: 30.0,
              ),
              icon: Icon(
                Icons.account_circle_outlined,
                color: AppColors.greyColor,
                size: 30.0,
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

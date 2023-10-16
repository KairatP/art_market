import 'package:art_market/constance/colors.dart';
import 'package:art_market/router/router_structure.dart';
import 'package:art_market/screens/welcome_page/bloc/welcome_bloc.dart';
import 'package:art_market/screens/welcome_page/data/welcome_data.dart';
import 'package:art_market/screens/welcome_page/widget/welcome_button_widget.dart';
import 'package:art_market/screens/welcome_page/widget/welcome_page_widget.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

WelcomeBloc welcomeBloc = WelcomeBloc();

class _WelcomePageState extends State<WelcomePage> {
  WelcomePageData welcomeData = WelcomePageData();
  PageController pageController = PageController(initialPage: 0);
  int count = 0;

  @override
  void initState() {
    welcomeBloc.add(const WelcomeEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WelcomeBloc, WelcomeState>(
      bloc: welcomeBloc,
      listenWhen: (previous, curent) => curent is WelcomeActionState,
      buildWhen: (previous, curent) => curent is! WelcomeActionState,
      listener: (context, state) {},
      builder: (context, state) {
        switch (state.runtimeType) {
          case WelcomeSuccessState:
            return Scaffold(
                backgroundColor: AppColors.whiteColor,
                body: Container(
                    color: AppColors.whiteColor,
                    margin: const EdgeInsets.only(top: 50),
                    // width: 375,
                    child: Column(children: [
                      Expanded(
                        child: Stack(
                          children: [
                            PageView.builder(
                              controller: pageController,
                              itemCount: welcomeData.pageData.length,
                              onPageChanged: (index) {
                                count = index;
                                welcomeBloc.add(const WelcomeEvent());
                              },
                              itemBuilder: (context, index) =>
                                  WelcomePageWidget(
                                      title: welcomeData.pageData[index]
                                              ["title"]
                                          .toString(),
                                      subTitle: welcomeData.pageData[index]
                                              ["subTitle"]
                                          .toString(),
                                      imagePath: welcomeData.pageData[index]
                                              ["imagePath"]
                                          .toString()),
                            ),
                            Positioned(
                                bottom: 10,
                                left: 50,
                                right: 50,
                                child: DotsIndicator(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    position: count,
                                    dotsCount: 3,
                                    decorator: DotsDecorator(
                                        color: Colors.grey,
                                        activeColor: AppColors.mainColor,
                                        size: const Size.square(8.0),
                                        activeSize: const Size(8.0, 8.0),
                                        activeShape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0)))))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 100,
                        child: GestureDetector(
                          onTap: () async {
                            int localCounter = count + 1;
                            if (count < 2) {
                              pageController.animateToPage(localCounter,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.decelerate);
                            } else {
                              Navigator.of(context)
                                  .pushNamedAndRemoveUntil(
                                      RouterStructure.tabBar, (route) => false);
                              final preferences =
                                  await SharedPreferences.getInstance();
                              await preferences.setBool('On_Boardingg', false);
                            }
                          },
                          child: WelcomeButtonWidget(
                              buttonName: welcomeData.pageData[count]
                                      ["buttonName"]
                                  .toString()),
                        ),
                      ),
                    ])));
          default:
            return const SizedBox();
        }
      },
    );
  }
}

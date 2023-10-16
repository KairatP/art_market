import 'package:art_market/constance/colors.dart';
import 'package:art_market/constance/text_style.dart';
import 'package:flutter/material.dart';

class WelcomeButtonWidget extends StatelessWidget {
  final String buttonName;
  const WelcomeButtonWidget({
    Key? key,
    required this.buttonName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        Container(
          margin: const EdgeInsets.only(left: 25, right: 25, bottom: 50),
          decoration: const BoxDecoration(
            color: AppColors.mainColor,
            borderRadius: BorderRadius.all(Radius.circular(15)),
            boxShadow: [
              AppTextStyle.appButtonShadow
            ]
          ),
          child: Center(
            child: Text(
              buttonName,
              style: AppTextStyle.appButtonTextStyle
            )
          ),
        );
  }
}

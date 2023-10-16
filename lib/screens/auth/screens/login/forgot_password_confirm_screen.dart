import 'package:art_market/constance/colors.dart';
import 'package:art_market/constance/text_style.dart';
import 'package:art_market/router/router_structure.dart';
import 'package:art_market/screens/auth/bloc/auth_bloc.dart';
import 'package:art_market/screens/auth/widgets/diget_text_field.dart';
import 'package:art_market/widgets/br_button.dart';
import 'package:flutter/material.dart';

class ForgotPswConfirmScreen extends StatelessWidget {
  ForgotPswConfirmScreen({
    Key? key,
    required this.sate,
    required this.bloc,
  }) : super(key: key);

  final AuthControlState sate;
  final AuthBloc bloc;

  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
  return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            '4-digit key has been sent to your email, please enter it in the fields below',
            style: AppTextStyle.blackBodyTextStyle,
            textAlign: TextAlign.center,
          ),
        ),

        const Spacer(),

        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          digetTextField(),
          digetTextField(),
          digetTextField(),
          digetTextField(),
        ]),
        const Spacer(),
        BrButton.text(
          textStyle:
              AppTextStyle.appBarTextStyle.copyWith(color: AppColors.mainColor),
          onPressed: () {
            Navigator.pushNamed(context, RouterStructure.tabBar);
          },
          label: 'Send password again',
        ),
        const SizedBox(
          height: 22,
        ),
        BrButton(
          label: 'Confirm',
          textStyle: AppTextStyle.appBarTextStyle,
          onPressed: () {
             bloc.add(RegTougleEvent(
                mainAuthTougle: sate.mainTougleState, registartionScreen: sate.regState, forgotScreen: sate.forgotScreen, loginScreen: sate.loginScreen, forgotPasswordConfirmScreen: false, passwordUpdateScreen: true));
          },
          color: AppColors.mainColor,
          textColor: AppColors.blackColor,
        ),
        const Spacer(
          flex: 1,
        ),
            BrButton.text(
        label: 'Back',
        textStyle: AppTextStyle.blueBodyTextStyle,
        onPressed: () {
          bloc.add(RegTougleEvent(
                mainAuthTougle: sate.mainTougleState, registartionScreen: sate.regState, forgotScreen: true, loginScreen: sate.loginScreen, forgotPasswordConfirmScreen: false, passwordUpdateScreen: sate.passwordUpdateScreen));
        },
      ),
      const Spacer(
              flex: 3,
            ),
      ],
    );
  }
}


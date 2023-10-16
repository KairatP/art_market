import 'package:art_market/constance/colors.dart';
import 'package:art_market/constance/text_style.dart';
import 'package:art_market/screens/auth/bloc/auth_bloc.dart';
import 'package:art_market/widgets/br_button.dart';
import 'package:art_market/widgets/br_text_field.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({
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
        const Spacer(
              flex: 3,
            ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            'Enter required information to be registered',
            style: AppTextStyle.blackBodyTextStyle,
            textAlign: TextAlign.left,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            BrTextField(
              controller: emailController,
              placeholder: 'Enter your E-mail',
              lableText: 'E-mail',
              validator: (email) {
                if (email == null || email.trim().isEmpty) {
                  return 'The text field must be filled in';
                } else {
                  return null;
                }
              },
            ),
          ],
        ),
        const SizedBox(
          height: 40,
        ),
        BrButton(
          textStyle: AppTextStyle.appBarTextStyle,
          textColor: AppColors.whiteColor,
          label: 'Send',
          onPressed: () {
            bloc.add(RegTougleEvent(
                mainAuthTougle: sate.mainTougleState, registartionScreen: sate.regState, forgotScreen: false, loginScreen: sate.loginScreen, forgotPasswordConfirmScreen: true, passwordUpdateScreen: sate.passwordUpdateScreen));
          },
        ),
        const Spacer(
              flex: 1,
            ),
            BrButton.text(
        label: 'Back',
        textStyle: AppTextStyle.blueBodyTextStyle,
        onPressed: () {
          bloc.add(RegTougleEvent(
                mainAuthTougle: sate.mainTougleState, registartionScreen: sate.regState, forgotScreen: sate.forgotScreen, loginScreen: true, forgotPasswordConfirmScreen: sate.forgotPasswordConfirmScreen, passwordUpdateScreen: sate.passwordUpdateScreen));
        },
      ),
      const Spacer(
              flex: 3,
            ),
      ],
    );
  }
}

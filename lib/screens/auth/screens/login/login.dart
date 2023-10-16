import 'package:art_market/constance/colors.dart';
import 'package:art_market/constance/text_style.dart';
import 'package:art_market/router/router_structure.dart';
import 'package:art_market/screens/auth/bloc/auth_bloc.dart';
import 'package:art_market/widgets/br_button.dart';
import 'package:art_market/widgets/br_text_field.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  Login({
    Key? key,
    required this.sate, 
    required this.bloc,
  }) : super(key: key);

  final AuthBloc bloc;
  final AuthControlState sate;
  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      const Spacer(
              flex: 1,
            ),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Text(
          'Enter your email and password',
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
            // prefixIcon: Icons,
            validator: (email) {
              if (email == null || email.trim().isEmpty) {
                return 'The text field must be filled in';
              }
              return null;
            },
          ),
        ],
      ),
      const SizedBox(
        height: 18,
      ),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Text(
          "Password",
          style: AppTextStyle.blackBodyTextStyle,
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      Row(
        children: [
          BrTextField(
            validator: (password) {
              if (password == null || password.trim().isEmpty) {
                return 'The text field must be filled in';
              }
              return null;
            },
            controller: passwordController,
            placeholder: 'Enter your password',
            lableText: 'Password',
            suffixIcon: sate.forgotScreen // need change to local bool
                ? const Icon(Icons.visibility_off, color: AppColors.mainColor)
                : const Icon(Icons.visibility, color: AppColors.mainColor),
            iconPressed: () {
              // isOpen = !isOpen;
            },
            obscureText: sate.mainTougleState,
          ),
        ],
      ),
      const Spacer(
              flex: 1,
            ),

      BrButton(
        label: 'Login',
        textStyle: AppTextStyle.appBarTextStyle,
        onPressed: () {
          Navigator.pushNamed(context, RouterStructure.profile);
        },
        color: AppColors.mainColor,
        textColor: AppColors.whiteColor,
      ),
      const Spacer(
              flex: 1,
            ),
      BrButton.text(
        label: 'Forgot password?',
        textStyle: AppTextStyle.blueBodyTextStyle,
        onPressed: () {
          bloc.add(RegTougleEvent(
                mainAuthTougle: sate.mainTougleState, registartionScreen: sate.regState, loginScreen: false, forgotScreen: sate.forgotScreen, forgotPasswordConfirmScreen: sate.forgotPasswordConfirmScreen, passwordUpdateScreen: sate.passwordUpdateScreen));
        },
      ),
      const Spacer(
              flex: 1,
            ),
    ],
  );
}
}


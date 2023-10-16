import 'package:art_market/constance/colors.dart';
import 'package:art_market/constance/text_style.dart';
import 'package:art_market/screens/auth/bloc/auth_bloc.dart';
import 'package:art_market/widgets/br_button.dart';
import 'package:art_market/widgets/br_text_field.dart';
import 'package:flutter/material.dart';

class PasswordUpdateScreen extends StatelessWidget {
  PasswordUpdateScreen({
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
              flex: 1,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                "Enter new password",
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
                  placeholder: 'Enter your new password',
                  lableText: 'New password',
                  suffixIcon: sate.mainTougleState // need chage to local bool 
                      ? const Icon(Icons.visibility_off, color: AppColors.mainColor)
                      : const Icon(Icons.visibility, color: AppColors.mainColor),
                  iconPressed: () {
                    // need same state and event to show password
                  },
                  obscureText: sate.mainTougleState,
                ),
              ],
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
                  placeholder: 'Repeat your new password',
                  lableText: 'Repeat your new password',
                  suffixIcon: sate.mainTougleState // need chage to local bool 
                      ? const Icon(Icons.visibility_off, color: AppColors.mainColor)
                      : const Icon(Icons.visibility, color: AppColors.mainColor),
                  iconPressed: () {
                    // need same state and event to show password
                  },
                  obscureText: sate.mainTougleState,
                ),
              ],
            ),
            const Spacer(
              flex: 1,
            ),

            // const SizedBox(
            //   height: 40,
            // ),
            BrButton(
              textStyle: AppTextStyle.appBarTextStyle,
              textColor: AppColors.whiteColor,
              label: 'Update password',
              onPressed: () {
                bloc.add(RegTougleEvent(
                  mainAuthTougle: sate.mainTougleState, registartionScreen: sate.regState, forgotScreen: sate.forgotScreen, loginScreen: true, forgotPasswordConfirmScreen: true, passwordUpdateScreen: sate.passwordUpdateScreen));
                    // mainAuthTougle: true, registartionScreen: sate.regState, forgotScreen: sate.forgotScreen, loginScreen: sate.loginScreen, forgotPasswordConfirmScreen: true, passwordUpdateScreen: false));
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
                mainAuthTougle: sate.mainTougleState, registartionScreen: sate.regState, forgotScreen: sate.forgotScreen, loginScreen: sate.loginScreen, forgotPasswordConfirmScreen: true, passwordUpdateScreen: false));
        },
      ),
      const Spacer(
              flex: 1,
            ),
          ],
        // ),
      // ],
    );
  }
}

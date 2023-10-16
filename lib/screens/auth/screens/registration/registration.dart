import 'package:art_market/constance/colors.dart';
import 'package:art_market/constance/text_style.dart';
import 'package:art_market/screens/auth/bloc/auth_bloc.dart';
import 'package:art_market/widgets/br_button.dart';
import 'package:art_market/widgets/br_text_field.dart';
import 'package:flutter/material.dart';

class Registration extends StatelessWidget {
  Registration({
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
        // ListView(
        //   shrinkWrap: true,
        //   padding: EdgeInsets.zero,
        //   children: [
            // const SizedBox(
            //   height: 18,
            // ),
            const Spacer(
              flex: 1,
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
                  // prefixIcon: const Padding(
                  //   // padding: EdgeInsets.all(12),
                  //   // child: SvgPicture.asset('assets/icons/profile_icon.svg'),
                  // ),
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
                  placeholder: 'Enter your Password',
                  lableText: 'Password',
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
                  placeholder: 'Repeat your Password',
                  lableText: 'Repeat your Password',
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
              label: 'Registration',
              onPressed: () {
                bloc.add(RegTougleEvent(
                    mainAuthTougle: sate.mainTougleState, registartionScreen: false, forgotScreen: sate.forgotScreen, loginScreen: sate.loginScreen, forgotPasswordConfirmScreen: sate.forgotPasswordConfirmScreen, passwordUpdateScreen: sate.passwordUpdateScreen));
              },
            ),
            const Spacer(
              flex: 1,
            )
          ],
        // ),
      // ],
    );
  }
}

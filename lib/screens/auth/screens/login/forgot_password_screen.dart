import 'package:art_market/constance/colors.dart';
import 'package:art_market/constance/text_style.dart';
import 'package:art_market/screens/auth/bloc/login_bloc.dart';
import 'package:art_market/widgets/gl_button.dart';
import 'package:art_market/widgets/gl_text_field.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({
    Key? key,
    required this.sate,
    required this.bloc,
  }) : super(key: key);

  final LoginBloc bloc;
  final LoginControlState sate;

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
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
              GlTextField(
                controller: emailController,
                placeholder: 'Enter your E-mail',
                lableText: 'E-mail',
                validator: (email) {
                  if (email == null ||
                      email.trim().isEmpty ||
                      !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                          .hasMatch(email)) {
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
          GlButton(
            textStyle: AppTextStyle.appBarWhiteTextStyle,
            textColor: AppColors.whiteColor,
            label: 'Send',
            onPressed: () {
              if (_formKey.currentState!.validate()) {

                widget.bloc.add(ForgetPasswordEvent(
                    mainAuthTougle: widget.sate.mainTougleState,
                    registartionScreen: widget.sate.registartionScreen,
                    forgotScreen: false,
                    loginScreen: widget.sate.loginScreen,
                    forgotPasswordConfirmScreen: true,
                    passwordUpdateScreen: widget.sate.passwordUpdateScreen,
                    email: emailController.text));
              } else {
                return;
              }
            },
          ),
          const Spacer(
            flex: 1,
          ),
          GlButton.text(
            label: 'Back',
            textStyle: AppTextStyle.blueBodyTextStyle,
            onPressed: () {
              widget.bloc.add(RegTougleEvent(
                  mainAuthTougle: widget.sate.mainTougleState,
                  registartionScreen: widget.sate.registartionScreen,
                  forgotScreen: widget.sate.forgotScreen,
                  loginScreen: true,
                  forgotPasswordConfirmScreen:
                      widget.sate.forgotPasswordConfirmScreen,
                  passwordUpdateScreen: widget.sate.passwordUpdateScreen));
            },
          ),
          const Spacer(
            flex: 3,
          ),
        ],
      ),
    );
  }
}

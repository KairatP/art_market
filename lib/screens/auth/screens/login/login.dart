import 'package:art_market/constance/colors.dart';
import 'package:art_market/constance/text_style.dart';
import 'package:art_market/screens/auth/bloc/login_bloc.dart';
import 'package:art_market/widgets/gl_button.dart';
import 'package:art_market/widgets/gl_text_field.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({
    Key? key,
    required this.sate,
    required this.bloc,
  }) : super(key: key);

  final LoginBloc bloc;
  final LoginControlState sate;

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
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
              GlTextField(
                textInputType: TextInputType.emailAddress,
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
              GlTextField(
                validator: (password) {
                  if (password == null || password.trim().isEmpty) {
                    return 'The text field must be filled in';
                  }
                  return null;
                },
                controller: passwordController,
                placeholder: 'Enter your password',
                lableText: 'Password',
                suffixIcon: IconButton(
                  icon: _showText // need chage to local bool
                      ? const Icon(Icons.visibility_off,
                          color: AppColors.mainColor)
                      : const Icon(Icons.visibility,
                          color: AppColors.mainColor),
                  onPressed: () {
                    _showText = !_showText;
                    widget.bloc.add(RegTougleEvent(
                        mainAuthTougle: widget.sate.mainTougleState,
                        registartionScreen: widget.sate.registartionScreen,
                        forgotScreen: widget.sate.forgotScreen,
                        loginScreen: widget.sate.loginScreen,
                        forgotPasswordConfirmScreen:
                            widget.sate.forgotPasswordConfirmScreen,
                        passwordUpdateScreen:
                            widget.sate.passwordUpdateScreen));
                  },
                ),
                obscureText: _showText,
              ),
            ],
          ),
          const Spacer(
            flex: 1,
          ),
          GlButton(
            label: 'Login',
            textStyle: AppTextStyle.appBarWhiteTextStyle,
            onPressed: () {
              // context.read<LoginBloc>().add((UserLoginEvent(password: passwordController.text, username: emailController.text)));

              // Navigator.pushNamedAndRemoveUntil(
              //     context, RouterStructure.tabBar, (route) => false);
              // loginStatus = true;

              if (_formKey.currentState!.validate()) {
                widget.bloc.add((UserLoginEvent(password: passwordController.text, username: emailController.text)));
              } else {
                return;
              }

            },
            color: AppColors.mainColor,
            textColor: AppColors.whiteColor,
          ),
          const Spacer(
            flex: 1,
          ),
          GlButton.text(
            label: 'Forgot password?',
            textStyle: AppTextStyle.blueBodyTextStyle,
            onPressed: () {
              widget.bloc.add(RegTougleEvent(
                  mainAuthTougle: widget.sate.mainTougleState,
                  registartionScreen: widget.sate.registartionScreen,
                  loginScreen: false,
                  forgotScreen: widget.sate.forgotScreen,
                  forgotPasswordConfirmScreen:
                      widget.sate.forgotPasswordConfirmScreen,
                  passwordUpdateScreen: widget.sate.passwordUpdateScreen));
            },
          ),
          const Spacer(
            flex: 1,
          ),
        ],
      ),
    );
  }
}

bool _showText = true;

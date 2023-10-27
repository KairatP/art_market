import 'package:art_market/constance/colors.dart';
import 'package:art_market/constance/text_style.dart';
import 'package:art_market/screens/auth/bloc/login_bloc.dart';
import 'package:art_market/widgets/gl_button.dart';
import 'package:art_market/widgets/gl_text_field.dart';
import 'package:flutter/material.dart';

class Registration extends StatefulWidget {
  const Registration({
    Key? key,
    required this.sate,
    required this.bloc,
  }) : super(key: key);

  final LoginBloc bloc;
  final LoginControlState sate;

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final passwordController = TextEditingController();
  final passwordVerificationController = TextEditingController();

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
                  if (password == null ||
                      password.trim().isEmpty ||
                      passwordController.text !=
                          passwordVerificationController.text) {
                    return 'The text field must be filled in';
                  }
                  return null;
                },
                controller: passwordController,
                placeholder: 'Enter your Password',
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
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              GlTextField(
                validator: (password) {
                  if (password == null ||
                      password.trim().isEmpty ||
                      passwordController.text !=
                          passwordVerificationController.text) {
                    return 'The text field must be filled in and passwords must be same';
                  }
                  return null;
                },
                controller: passwordVerificationController,
                placeholder: 'Repeat your Password',
                lableText: 'Repeat your Password',
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
            textStyle: AppTextStyle.appBarWhiteTextStyle,
            textColor: AppColors.whiteColor,
            label: 'Registration',
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                widget.bloc.add(UserCreateEvent(confirmPassword: passwordVerificationController.text, email: emailController.text, password: passwordController.text));

                // widget.bloc.add(RegTougleEvent(
                //     mainAuthTougle: widget.sate.mainTougleState,
                //     registartionScreen: false,
                //     forgotScreen: widget.sate.forgotScreen,
                //     loginScreen: widget.sate.loginScreen,
                //     forgotPasswordConfirmScreen:
                //         widget.sate.forgotPasswordConfirmScreen,
                //     passwordUpdateScreen: widget.sate.passwordUpdateScreen));
              } else {
                return;
              }
            },
          ),
          const Spacer(
            flex: 1,
          )
        ],
      ),
    );
  }
}

bool _showText = true;

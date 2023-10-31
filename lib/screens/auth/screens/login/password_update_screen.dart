import 'package:art_market/constance/colors.dart';
import 'package:art_market/constance/text_style.dart';
import 'package:art_market/screens/auth/bloc/login_bloc.dart';
import 'package:art_market/widgets/gl_button.dart';
import 'package:art_market/widgets/gl_text_field.dart';
import 'package:flutter/material.dart';

class PasswordUpdateScreen extends StatefulWidget {
  const PasswordUpdateScreen({
    Key? key,
    required this.sate,
    required this.bloc,
  }) : super(key: key);

  final LoginBloc bloc;
  final LoginControlState sate;

  @override
  State<PasswordUpdateScreen> createState() => _PasswordUpdateScreenState();
}

class _PasswordUpdateScreenState extends State<PasswordUpdateScreen> {
  final passwordController = TextEditingController();
  final passwordVerificationController = TextEditingController();
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
                  "Enter new password",
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
                      if (password == null || password.trim().isEmpty || passwordController.text != passwordVerificationController.text) {
                        return 'The text field must be filled in';
                      }
                      return null;
                    },
                    controller: passwordController,
                    placeholder: 'Enter your new password',
                    lableText: 'New password',
                    suffixIcon: 
                    
                    IconButton(
                  icon: _showText // need chage to local bool
                    ? const Icon(Icons.visibility_off, color: AppColors.mainColor)
                    : const Icon(Icons.visibility, color: AppColors.mainColor),
                  onPressed: (){
                    _showText = !_showText;
                     widget.bloc.add(RegTougleEvent(
                      mainAuthTougle: widget.sate.mainTougleState,
                      registartionScreen: widget.sate.registartionScreen,
                      forgotScreen: widget.sate.forgotScreen,
                      loginScreen: widget.sate.loginScreen,
                      forgotPasswordConfirmScreen:
                          widget.sate.forgotPasswordConfirmScreen,
                      passwordUpdateScreen: widget.sate.passwordUpdateScreen));
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
                      if (password == null || password.trim().isEmpty || passwordController.text != passwordVerificationController.text) {
                        return 'The text field must be filled in';
                      }
                      return null;
                    },
                    controller: passwordVerificationController,
                    placeholder: 'Repeat your new password',
                    lableText: 'Repeat your new password',
                    suffixIcon: 
                    
                    
                    IconButton(
                  icon: _showText // need chage to local bool
                    ? const Icon(Icons.visibility_off, color: AppColors.mainColor)
                    : const Icon(Icons.visibility, color: AppColors.mainColor),
                  onPressed: (){
                    _showText = !_showText;
                     widget.bloc.add(RegTougleEvent(
                      mainAuthTougle: widget.sate.mainTougleState,
                      registartionScreen: widget.sate.registartionScreen,
                      forgotScreen: widget.sate.forgotScreen,
                      loginScreen: widget.sate.loginScreen,
                      forgotPasswordConfirmScreen:
                          widget.sate.forgotPasswordConfirmScreen,
                      passwordUpdateScreen: widget.sate.passwordUpdateScreen));
                  },
    
                ),
                    obscureText: _showText,
                  ),
                ],
              ),
              const Spacer(
                flex: 1,
              ),
    
              // const SizedBox(
              //   height: 40,
              // ),
              GlButton(
                textStyle: AppTextStyle.appBarWhiteTextStyle,
                textColor: AppColors.whiteColor,
                label: 'Update password',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    widget.bloc.add(ChangePasswordEvent(
                    mainAuthTougle: true, 
                    registartionScreen: widget.sate.registartionScreen, 
                    forgotScreen: widget.sate.forgotScreen, 
                    loginScreen: true, 
                    forgotPasswordConfirmScreen: widget.sate.forgotPasswordConfirmScreen, 
                    passwordUpdateScreen: widget.sate.passwordUpdateScreen, 
                    password: passwordController.text, 
                    confirmPassword: passwordVerificationController.text,
                    ));
                  }
                  
                      // mainAuthTougle: true, registartionScreen: sate.regState, forgotScreen: sate.forgotScreen, loginScreen: sate.loginScreen, forgotPasswordConfirmScreen: true, passwordUpdateScreen: false));
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
                  mainAuthTougle: widget.sate.mainTougleState, registartionScreen: widget.sate.registartionScreen, forgotScreen: widget.sate.forgotScreen, loginScreen: widget.sate.loginScreen, forgotPasswordConfirmScreen: true, passwordUpdateScreen: false));
          },
        ),
        const Spacer(
                flex: 1,
              ),
            ],
          // ),
        // ],
      ),
    );
  }
}

bool _showText = true;
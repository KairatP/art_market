import 'package:art_market/constance/colors.dart';
import 'package:art_market/constance/text_style.dart';
import 'package:art_market/router/router_structure.dart';
import 'package:art_market/screens/auth/bloc/login_bloc.dart';
import 'package:art_market/screens/auth/widgets/diget_text_field.dart';
import 'package:art_market/widgets/gl_button.dart';
import 'package:flutter/material.dart';

class RegConfirmScreen extends StatefulWidget {
  const RegConfirmScreen({
    Key? key,
    required this.sate,
    required this.bloc,
  }) : super(key: key);

  final LoginBloc bloc;
  final LoginControlState sate;

  @override
  State<RegConfirmScreen> createState() => _RegConfirmScreenState();
}

class _RegConfirmScreenState extends State<RegConfirmScreen> {
  // final diitController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
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
            digetTextField(validator: (digg) {
              if (digg == null ||
                      digg.trim().isEmpty) {
                    return 'The text field must be filled';
                  }
                  return null;
            }),
            digetTextField(validator: (digg) {
              if (digg == null ||
                      digg.trim().isEmpty) {
                    return 'The text field must be filled';
                  }
                  return null;
            }),
            digetTextField(validator: (digg) {
              if (digg == null ||
                      digg.trim().isEmpty) {
                    return 'The text field must be filled';
                  }
                  return null;
            }),
            digetTextField(validator: (digg) {
              if (digg == null ||
                      digg.trim().isEmpty) {
                    return 'The text field must be filled';
                  }
                  return null;
            }),
          ]),
          const Spacer(),
          GlButton.text(
            textStyle: AppTextStyle.appBarTextStyle
                .copyWith(color: AppColors.mainColor),
            onPressed: () {
              Navigator.pushNamed(context, RouterStructure.tabBar);
            },
            label: 'Send password again',
          ),
          const SizedBox(
            height: 22,
          ),
          GlButton(
            label: 'Confirm',
            textStyle: AppTextStyle.appBarWhiteTextStyle,
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                widget.bloc.add(RegTougleEvent(
                  mainAuthTougle: true,
                  registartionScreen: true,
                  forgotScreen: widget.sate.forgotScreen,
                  loginScreen: true,
                  forgotPasswordConfirmScreen:
                      widget.sate.forgotPasswordConfirmScreen,
                  passwordUpdateScreen: widget.sate.passwordUpdateScreen));
              } else {
                return;
              }
              
            },
            color: AppColors.mainColor,
            textColor: AppColors.blackColor,
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
                  registartionScreen: true,
                  loginScreen: widget.sate.loginScreen,
                  forgotScreen: widget.sate.forgotScreen,
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

import 'package:art_market/constance/colors.dart';
import 'package:art_market/constance/text_style.dart';
import 'package:art_market/screens/auth/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';

class AuthTougleWidget extends StatelessWidget {
  const AuthTougleWidget({
    Key? key,
    required this.onChanged,
    this.selectedindex,
    required this.bloc,
    required this.sate,
  }) : super(key: key);

  final AuthBloc bloc;
  final AuthControlState sate;
  final Function(bool selectedindex) onChanged;
  final bool? selectedindex;
  

  @override
  Widget build(BuildContext context) {
    List<bool> isSelected = [true, false];
    return Container(
        padding: const EdgeInsets.all(2),
        width: 308,
        height: 32,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: const Color.fromARGB(48, 51, 51, 51),
        ),
        child: ToggleButtons(
          splashColor: AppColors.transparentColor,
          renderBorder: false,
          selectedColor: AppColors.transparentColor,
          color: AppColors.transparentColor,
          fillColor: AppColors.transparentColor,
          isSelected: isSelected,
       
          onPressed: (int index) {
            // widget.onChanged(index);
            if (index == 0) {
              bloc.add(RegTougleEvent(
                  mainAuthTougle: true,
                  registartionScreen: sate.regState,
                  forgotScreen: sate.forgotScreen, loginScreen: sate.loginScreen, forgotPasswordConfirmScreen: sate.forgotPasswordConfirmScreen, passwordUpdateScreen: sate.passwordUpdateScreen));
              // onChanged(true);
              isSelected = [true, false];
            } else {
              // onChanged(false);
              isSelected = [false, true];
              bloc.add(RegTougleEvent(
                  mainAuthTougle: false,
                  registartionScreen: sate.regState,
                  forgotScreen: sate.forgotScreen, loginScreen: sate.loginScreen, forgotPasswordConfirmScreen: sate.forgotPasswordConfirmScreen, passwordUpdateScreen: sate.passwordUpdateScreen));
            }
          },
          children: <Widget>[
            _CustomToggleButton(
              buttonText: "LOG IN",
              // isSelected: isSelected[0]
              isSelected: sate.mainTougleState
              
            ),
            _CustomToggleButton(
              buttonText: "REGISTRATION",
              // isSelected: isSelected[1]
              isSelected: !sate.mainTougleState
            ),
          ],
        ));
  }
}

class _CustomToggleButton extends StatelessWidget {
  final bool isSelected;
  final String buttonText;

  const _CustomToggleButton({
    Key? key,
    this.isSelected = false,
    required this.buttonText,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 152,
      decoration: BoxDecoration(
        color: isSelected == true
            ? AppColors.whiteColor
            : AppColors.transparentColor,
        border: Border.all(
          color: AppColors.transparentColor,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(7),
        ),
      ),
      padding: const EdgeInsets.only(left: 8, right: 8, top: 6, bottom: 6),
      child: Text(
        buttonText,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        textAlign: TextAlign.center,
        style: isSelected == true
            ? AppTextStyle.blackBodyTextStyle
            : AppTextStyle.greyBodyTextStyle,
      ),
    );
  }
}

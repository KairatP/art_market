import 'package:art_market/constance/colors.dart';
import 'package:art_market/dependencies/injection_container.dart';
import 'package:art_market/router/router_structure.dart';
import 'package:art_market/screens/auth/bloc/login_bloc.dart';
import 'package:art_market/screens/auth/screens/login/forgot_password_confirm_screen.dart';
import 'package:art_market/screens/auth/screens/login/forgot_password_screen.dart';
import 'package:art_market/screens/auth/screens/login/login.dart';
import 'package:art_market/screens/auth/screens/login/password_update_screen.dart';
import 'package:art_market/screens/auth/screens/registration/reg_confirm_screen.dart';
import 'package:art_market/screens/auth/screens/registration/registration.dart';
import 'package:art_market/screens/auth/widgets/touggle_widget.dart';
import 'package:art_market/widgets/gl_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}
  final Box userBox = Hive.box('user');
  final Box tokenBox = Hive.box('tokens');

class _AuthScreenState extends State<AuthScreen> {
  final LoginBloc authBloc = LoginBloc(authService: getIt());

  @override
  void initState() {
    authBloc.add((InitialEvent()));
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      bloc: authBloc,
      listenWhen: (previous, curent) => curent is LoginActionState,
      buildWhen: (previous, curent) => curent is! LoginActionState,
      listener: (context, state) {
        if (state is LoginSusseccActionState) {
          Navigator.pushNamedAndRemoveUntil(context, RouterStructure.tabBar, (route) => false);
              // loginStatus = true;
        } else if (state is IncorrectDataState) {
          showCupertinoModalPopup(
            context: context,
            builder: (context) {
              return CupertinoAlertDialog(
                title: const Text('Error'),
                content: const Text("Has been applied incorrect data"),
                actions: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 15,
                    ),
                    child: GlButton(
                      label: 'Ok',
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ],
              );
            },
          );
        } else if (state is LoginFailedState) {
          showCupertinoModalPopup(
            context: context,
            builder: (context) {
              return CupertinoAlertDialog(
                title: const Text('Error'),
                content: const Text("UNKNOWN_ERROR"),
                actions: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 15,
                    ),
                    child: GlButton(
                      label: 'Ok',
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ],
              );
            },
          );
        } else if (state is UserSussecufulyCreatedState) {
          showCupertinoModalPopup(
            context: context,
            builder: (context) {
              return CupertinoAlertDialog(
                title: const Text('Confirmation message'),
                content: const Text("Account has successfully created"),
                actions: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 15,
                    ),
                    child: GlButton(
                      label: 'Ok',
                      
                      onPressed: () => Navigator.pop(context),
                      // authBloc.add(RegTougleEvent(mainAuthTougle: true, forgotScreen: true, registartionScreen: true, loginScreen: true, forgotPasswordConfirmScreen: true, passwordUpdateScreen: true)),
                      
                    ),
                  ),
                ],
                
              );
            },
          );
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {

          // case IncorrectDataState:
          //   return const Scaffold(
          //     body: Center(
          //       child: Text("Has been applied incorrect data",
          //           style: AppTextStyle.appBarTextStyle,
          //   )));

          // case LoginFailedState:
          //   return const Scaffold(
          //     body: Center(
          //       child: Text("UNKNOWN_ERROR",
          //           style: AppTextStyle.appBarTextStyle,
          // )));

          case LoginControlState:
          final loginState = state as LoginControlState;
            return Scaffold(
              backgroundColor: AppColors.whiteColor,
              body: 
                Column(
                  children: [
                    const SizedBox(
                      height: 80,
                    ),
                    AuthTougleWidget(
                      onChanged: (index) {
                        loginState.mainTougleState = index;
                      }, 
                      bloc: authBloc, 
                      sate: loginState,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Expanded(
                      child: Container(
                        width: double.maxFinite,
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12, 
                          vertical: 10,
                        ),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only( 
                            topLeft: Radius.circular(15), 
                            topRight: Radius.circular(15),
                          ),
                        ),
                        child: loginState.mainTougleState 
                        ?
                        loginState.loginScreen 
                        ?
                        Login(sate: loginState, bloc: authBloc,) 
                        :
                        loginState.forgotScreen 
                        ?
                        ForgotPasswordScreen(sate: loginState, bloc: authBloc,)
                        :
                        loginState.forgotPasswordConfirmScreen
                        ?
                        ForgotPswConfirmScreen(sate: loginState, bloc: authBloc)
                        :
                        PasswordUpdateScreen(sate: loginState, bloc: authBloc)
                        :
                        loginState.registartionScreen 
                        ?
                        // ? 
                        Registration(sate: loginState, bloc: authBloc)
                        : 
                        RegConfirmScreen(sate: loginState, bloc: authBloc,),
                      )
                    )
                  ]
                )

            );
          case LoginErrorState:
            return const Scaffold(
              body: Center(
                child: Text("Error"),
              ),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}
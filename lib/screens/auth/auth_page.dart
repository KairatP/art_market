import 'package:art_market/constance/colors.dart';
import 'package:art_market/screens/auth/bloc/auth_bloc.dart';
import 'package:art_market/screens/auth/screens/login/forgot_password_confirm_screen.dart';
import 'package:art_market/screens/auth/screens/login/forgot_password_screen.dart';
import 'package:art_market/screens/auth/screens/login/login.dart';
import 'package:art_market/screens/auth/screens/login/password_update_screen.dart';
import 'package:art_market/screens/auth/screens/registration/reg_confirm_screen.dart';
import 'package:art_market/screens/auth/screens/registration/registration.dart';
import 'package:art_market/screens/auth/widgets/touggle_widget.dart';
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
  final AuthBloc authBloc = AuthBloc();

  @override
  void initState() {
    authBloc.add((InitialEvent()));
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      bloc: authBloc,
      listenWhen: (previous, curent) => curent is AuthActionState,
      buildWhen: (previous, curent) => curent is! AuthActionState,
      listener: (context, state) {
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case AuthControlState:
          final authState = state as AuthControlState;
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
                        authState.mainTougleState = index;


                        // setState(() {
                          
                        // });
                      }, 
                      bloc: authBloc, 
                      sate: authState,
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
                        child: authState.mainTougleState 
                        ?
                        authState.loginScreen 
                        ?
                        Login(sate: authState, bloc: authBloc,) 
                        :
                        authState.forgotScreen 
                        ?
                        ForgotPasswordScreen(sate: authState, bloc: authBloc,)
                        :
                        authState.forgotPasswordConfirmScreen
                        ?
                        ForgotPswConfirmScreen(sate: authState, bloc: authBloc)
                        :
                        PasswordUpdateScreen(sate: authState, bloc: authBloc)
                        :
                        authState.regState 
                        ?
                        // ? 
                        Registration(sate: authState, bloc: authBloc)
                        : 
                        RegConfirmScreen(sate: authState, bloc: authBloc,),
                      )
                    )
                  ]
                )

            );
          case AuthErrorState:
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
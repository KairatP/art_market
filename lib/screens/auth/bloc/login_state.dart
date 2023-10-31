part of 'login_bloc.dart';

abstract class LoginState {}

final class LoginInitial extends LoginState {}

class LoginControlState extends LoginState {
  bool mainTougleState;
  bool forgotScreen;
  bool loginScreen;
  bool registartionScreen;
  bool forgotPasswordConfirmScreen;
  bool passwordUpdateScreen;
  // TextEditingController passwordController;

  LoginControlState({
    this.mainTougleState = true,
    this.forgotScreen = true,
    this.registartionScreen = true,
    this.loginScreen = true,
    this.forgotPasswordConfirmScreen = true,
    this.passwordUpdateScreen = true,
    // required this.passwordController,
  });

  List<Object?> get props => [
        mainTougleState,
        forgotScreen,
        registartionScreen,
        loginScreen,
        forgotPasswordConfirmScreen,
        passwordUpdateScreen,
        // passwordController
      ];
}





final class LoginErrorState extends LoginState {}

abstract class LoginActionState extends LoginState {}

class LoginSusseccActionState extends LoginActionState {}
class IncorrectDataState extends LoginActionState {}
class LoginFailedState extends LoginActionState {}

class UserSussecufulyCreatedState extends LoginActionState {}
class UserSussecufulyUpdateState extends LoginActionState {}




part of 'auth_bloc.dart';

abstract class AuthState {
  const AuthState();
}

final class AuthInitialState extends AuthState {}

final class AuthControlState extends AuthState {
  bool mainTougleState;
  bool forgotScreen;
  bool loginScreen;
  bool regState;
  bool forgotPasswordConfirmScreen;
  bool passwordUpdateScreen;

  AuthControlState({
    required this.mainTougleState, 
    required this.forgotScreen, 
    required this.regState, 
    required this.loginScreen,
    required this.forgotPasswordConfirmScreen,
    required this.passwordUpdateScreen,
    
    });
}

final class AuthErrorState extends AuthState {}

abstract class AuthActionState extends AuthState {}

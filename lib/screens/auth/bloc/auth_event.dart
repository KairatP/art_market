part of 'auth_bloc.dart';

sealed class AuthEvent {
  const AuthEvent();
}

class InitialEvent extends AuthEvent {}

class RegTougleEvent extends AuthEvent {
  final bool mainAuthTougle;
  final bool forgotScreen;
  final bool registartionScreen;
  final bool loginScreen;
  final bool forgotPasswordConfirmScreen;
  final bool passwordUpdateScreen;
  RegTougleEvent({
    required this.mainAuthTougle,
    required this.forgotScreen,
    required this.registartionScreen,
    required this.loginScreen,
    required this.forgotPasswordConfirmScreen,
    required this.passwordUpdateScreen,
  });
}

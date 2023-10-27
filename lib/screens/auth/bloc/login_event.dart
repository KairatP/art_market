part of 'login_bloc.dart';

class LoginEvent {
  const LoginEvent();
}

class InitialEvent extends LoginEvent {}

class RegTougleEvent extends LoginEvent {
  final bool mainAuthTougle;
  final bool forgotScreen;
  final bool registartionScreen;
  final bool loginScreen;
  final bool forgotPasswordConfirmScreen;
  final bool passwordUpdateScreen;
  // final TextEditingController passwordController;
  RegTougleEvent({
    required this.mainAuthTougle,
    required this.forgotScreen,
    required this.registartionScreen,
    required this.loginScreen,
    required this.forgotPasswordConfirmScreen,
    required this.passwordUpdateScreen,
    // required this.passwordController,
  });

  List<Object?> get props => [
        mainAuthTougle,
        forgotScreen,
        registartionScreen,
        loginScreen,
        forgotPasswordConfirmScreen,
        passwordUpdateScreen,
        // passwordController
      ];
}

class UserCreateEvent extends LoginEvent {
  final String email;
  final String password;
  final String confirmPassword;
  UserCreateEvent({
    required this.email,
    required this.password,
    required this.confirmPassword,
  });
}

class UserLoginEvent extends LoginEvent {
  final String username;
  final String password;
  UserLoginEvent({
    required this.username,
    required this.password,
  });
}

class ForgetPasswordEvent extends LoginEvent {
  final String email;
  ForgetPasswordEvent({
    required this.email,
  });

}

class ChangePasswordEvent extends LoginEvent {
  final String email;
  final String password;
  final String confirmPassword;
  ChangePasswordEvent({
    required this.email,
    required this.password,
    required this.confirmPassword,
  });
}

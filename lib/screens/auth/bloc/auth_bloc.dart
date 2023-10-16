import 'dart:async';
import 'package:bloc/bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitialState()) {
    on<InitialEvent>(_onInitialEvent);
    on<RegTougleEvent>(_onRegTougleEvent);
  }

  FutureOr<void> _onInitialEvent(InitialEvent event, Emitter<AuthState> emit) {
    emit(AuthControlState(mainTougleState: true, regState: true, forgotScreen: true, loginScreen: true, forgotPasswordConfirmScreen: true, passwordUpdateScreen: true));
  }

  FutureOr<void> _onRegTougleEvent(
      RegTougleEvent event, Emitter<AuthState> emit) {
    emit(AuthControlState(
        mainTougleState: event.mainAuthTougle, forgotScreen: event.forgotScreen, regState: event.registartionScreen, loginScreen: event.loginScreen, forgotPasswordConfirmScreen: event.forgotPasswordConfirmScreen, passwordUpdateScreen: event.passwordUpdateScreen));
  }
}

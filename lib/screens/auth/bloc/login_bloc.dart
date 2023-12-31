import 'dart:async';

import 'package:art_market/dependencies/services/auth_service.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({required this.authService}) : super(LoginInitial()) {
    on<InitialEvent>(_onInitialEvent);
    on<RegTougleEvent>(_onRegTougleEvent);
    on<UserCreateEvent>(_onUserCreateEvent);
    on<UserLoginEvent>(_onUserLoginEvent);
    on<ForgetPasswordEvent>(_onForgetPasswordEvent);
    on<ConfirmPasswordEvent>(_onConfirmPasswordEvent);
    on<ChangePasswordEvent>(_onChangePasswordEvent);
  }

  FutureOr<void> _onInitialEvent(InitialEvent event, Emitter<LoginState> emit) {
    emit(LoginControlState());
  }

  FutureOr<void> _onRegTougleEvent(
      RegTougleEvent event, Emitter<LoginState> emit) {
    emit(LoginControlState(
        mainTougleState: event.mainAuthTougle,
        forgotScreen: event.forgotScreen,
        registartionScreen: event.registartionScreen,
        loginScreen: event.loginScreen,
        forgotPasswordConfirmScreen: event.forgotPasswordConfirmScreen,
        passwordUpdateScreen: event.passwordUpdateScreen));
  }

  final AuthService authService;

  Future<FutureOr<void>> _onUserCreateEvent(
      UserCreateEvent event, Emitter<LoginState> emit) async {
    try {
      await authService.create(
          event.email, event.password, event.confirmPassword);
      emit(UserSussecufulyCreatedState());
      emit(LoginControlState());
    } on DioException {
      
      emit(IncorrectDataState());
      rethrow;
    } catch (e) {
      emit(LoginFailedState());
      rethrow;
    }
  }

  Future<FutureOr<void>> _onUserLoginEvent(
      UserLoginEvent event, Emitter<LoginState> emit) async {
        
    try {
      await authService.login(
          event.username.toString(), event.password.toString());
      emit(LoginSusseccActionState());
    } on DioException {
      emit(IncorrectDataState());
      rethrow;
    } catch (e) {
      emit(LoginFailedState());
      rethrow;
    }
  }

  Future<FutureOr<void>> _onForgetPasswordEvent(
      ForgetPasswordEvent event, Emitter<LoginState> emit) async {
    try {
      await authService.forgetPassword(event.email);
      email = event.email;
      emit(LoginControlState(
          mainTougleState: event.mainAuthTougle,
          forgotScreen: event.forgotScreen,
          registartionScreen: event.registartionScreen,
          loginScreen: event.loginScreen,
          forgotPasswordConfirmScreen: event.forgotPasswordConfirmScreen,
          passwordUpdateScreen: event.passwordUpdateScreen));
    } on DioException {
      emit(IncorrectDataState());
      rethrow;
    } catch (e) {
      emit(LoginFailedState());
      rethrow;
    }
  }

  Future<FutureOr<void>> _onConfirmPasswordEvent(
      ConfirmPasswordEvent event, Emitter<LoginState> emit) async {
    try {
      await authService.forgetPassword(event.email);
      emit(LoginSusseccActionState());
    } on DioException {
      emit(IncorrectDataState());
      rethrow;
    } catch (e) {
      emit(LoginFailedState());
      rethrow;
    }
  }

  Future<FutureOr<void>> _onChangePasswordEvent(
      ChangePasswordEvent event, Emitter<LoginState> emit) async {
    try {
      await authService.changePassword(
          email, event.password, event.confirmPassword);
      emit(UserSussecufulyUpdateState());
      emit(LoginControlState(
          mainTougleState: event.mainAuthTougle,
          forgotScreen: event.forgotScreen,
          registartionScreen: event.registartionScreen,
          loginScreen: event.loginScreen,
          forgotPasswordConfirmScreen: event.forgotPasswordConfirmScreen,
          passwordUpdateScreen: event.passwordUpdateScreen));
    } on DioException {
      emit(IncorrectDataState());
      rethrow;
    } catch (e) {
      emit(LoginFailedState());
      rethrow;
    }
  }
}

var email = '';

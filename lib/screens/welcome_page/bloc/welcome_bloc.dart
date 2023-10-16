import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'welcome_event.dart';
part 'welcome_states.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  WelcomeBloc() : super(WelcomeSuccessState()) {
    on<WelcomeEvent>(_welcomeEvent);
  }

  FutureOr<void> _welcomeEvent(
      WelcomeEvent event, Emitter<WelcomeState> emit) async {
        emit(WelcomeSuccessState());
  }
}

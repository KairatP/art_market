import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tab_bar_event.dart';
part 'tab_bar_state.dart';

class TabBarBloc extends Bloc<TabBarEvent, TabBarState> {
  TabBarBloc() : super(TabBarInitial()) {
    on<TabBarEvent>((event, emit) {
    });
  }
}

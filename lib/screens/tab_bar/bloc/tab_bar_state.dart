part of 'tab_bar_bloc.dart';

sealed class TabBarState extends Equatable {
  const TabBarState();
  
  @override
  List<Object> get props => [];
}

final class TabBarInitial extends TabBarState {}

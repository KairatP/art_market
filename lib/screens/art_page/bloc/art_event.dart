part of 'art_bloc.dart';

@immutable
abstract class ArtEvent {}

// Inisiate first data loading
class InitialOrderEvent extends ArtEvent with EquatableMixin {
  // final bool initiatePermission;
  // InitialOrderEvent({required this.initiatePermission});

  @override
  List<Object?> get props => [];
}

// Navigate to fillter view when press fillter button
class FilterButtonNavigateEvent extends ArtEvent {}

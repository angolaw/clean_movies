part of 'movietab_bloc.dart';

abstract class MovieTabEvent extends Equatable {
  const MovieTabEvent();

  @override
  List<Object> get props => [];
}

class MovieTabChangedEvent extends MovieTabEvent {
  final int currentTabIndex;

  const MovieTabChangedEvent({required this.currentTabIndex});

  @override
  List<Object> get props => [currentTabIndex];
}

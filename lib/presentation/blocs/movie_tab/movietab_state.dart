part of 'movietab_bloc.dart';

abstract class MovieTabState extends Equatable {
  final int currentTabIndex;
  const MovieTabState({required this.currentTabIndex});

  @override
  List<Object> get props => [currentTabIndex];
}

class MovieTabInitial extends MovieTabState {
  const MovieTabInitial() : super(currentTabIndex: 0);
}

class MovieTabChanged extends MovieTabState {
  final List<MovieEntity?> movies;

  const MovieTabChanged({required this.movies, required int currentTabIndex})
      : super(currentTabIndex: currentTabIndex);
  @override
  List<Object> get props => [movies, currentTabIndex];
}

class MovieTabLoadError extends MovieTabState {
  const MovieTabLoadError({required int currentTabIndex})
      : super(currentTabIndex: currentTabIndex);
  @override
  List<Object> get props => [];
}

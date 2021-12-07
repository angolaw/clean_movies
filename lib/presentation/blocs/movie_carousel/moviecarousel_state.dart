part of 'moviecarousel_bloc.dart';

abstract class MoviecarouselState extends Equatable {
  const MoviecarouselState();

  @override
  List<Object> get props => [];
}

class MoviecarouselInitial extends MoviecarouselState {}

class MovieCarouselError extends MoviecarouselState {
  final AppErrorType errorType;

  const MovieCarouselError({required this.errorType});
  @override
  List<Object> get props => [errorType];
}

class MovieCarouselLoaded extends MoviecarouselState {
  final List<MovieEntity?> movies;
  final int defaultIndex;

  const MovieCarouselLoaded({required this.movies, required this.defaultIndex});

  @override
  List<Object> get props => [movies, defaultIndex];
}

part of 'moviecarousel_bloc.dart';

abstract class MoviecarouselState extends Equatable {
  const MoviecarouselState();

  @override
  List<Object> get props => [];
}

class MoviecarouselInitial extends MoviecarouselState {}

class MovieCarouselError extends MoviecarouselState {}

class MovieCarouselLoaded extends MoviecarouselState {
  final List<MovieEntity?> movies;
  final int defaultIndex;

  MovieCarouselLoaded({required this.movies, required this.defaultIndex});

  @override
  // TODO: implement props
  List<Object> get props => [movies, defaultIndex];
}

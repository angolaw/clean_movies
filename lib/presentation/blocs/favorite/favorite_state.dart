part of 'favorite_bloc.dart';

abstract class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object> get props => [];
}

class FavoriteInitial extends FavoriteState {}

class FavoriteMoviesLoaded extends FavoriteState {
  final List<MovieEntity> movies;

  FavoriteMoviesLoaded({required this.movies});

  @override
  List<Object> get props => [movies];
}

class FavoriteMoviesError extends FavoriteState {}

class IsFavoriteMovie extends FavoriteState {
  final bool isMovieFavorite;

  IsFavoriteMovie({required this.isMovieFavorite});

  @override
  List<Object> get props => [isMovieFavorite];
}

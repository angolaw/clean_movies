part of 'favorite_bloc.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();

  @override
  List<Object> get props => [];
}

class LoadFavoriteEvent extends FavoriteEvent {}

class DeleteFavoriteMovieEvent extends FavoriteEvent {
  final int movieId;

  const DeleteFavoriteMovieEvent({required this.movieId});

  @override
  List<Object> get props => [movieId];
}

class ToggleFavoriteMovieEvent extends FavoriteEvent {
  final int movieId;
  final bool isFavorite;

  const ToggleFavoriteMovieEvent(
      {required this.movieId, required this.isFavorite});

  @override
  List<Object> get props => [movieId, isFavorite];
}

class CheckIfMovieFavoriteEvent extends FavoriteEvent {
  final int movieId;

  const CheckIfMovieFavoriteEvent({required this.movieId});

  @override
  List<Object> get props => [movieId];
}

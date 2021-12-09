import 'package:bloc/bloc.dart';
import 'package:clean_movies/domain/entities/app_error.dart';
import 'package:clean_movies/domain/entities/movie_entity.dart';
import 'package:clean_movies/domain/entities/movie_params.dart';
import 'package:clean_movies/domain/usecases/check_if_favorite_movie.dart';
import 'package:clean_movies/domain/usecases/delete_favorite_movie.dart';
import 'package:clean_movies/domain/usecases/get_favorite_movies.dart';
import 'package:clean_movies/domain/usecases/no_params.dart';
import 'package:clean_movies/domain/usecases/save_movie.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final SaveMovie saveMovie;
  final GetFavoriteMovies getFavoriteMovies;
  final DeleteFavoriteMovie deleteFavoriteMovie;
  final CheckIfFavoriteMovie checkIfFavoriteMovie;
  FavoriteCubit({
    required this.saveMovie,
    required this.getFavoriteMovies,
    required this.deleteFavoriteMovie,
    required this.checkIfFavoriteMovie,
  }) : super(FavoriteInitial());

  void toggleFavoriteMovie(MovieEntity movie, bool isFavorite) async {
    if (isFavorite) {
      await deleteFavoriteMovie(MovieParams(id: movie.id));
    } else {
      await saveMovie(movie);
    }
    final response = await checkIfFavoriteMovie(MovieParams(id: movie.id));
    emit(response.fold((l) => FavoriteMoviesError(),
        (r) => IsFavoriteMovie(isMovieFavorite: r)));
  }

  void loadFavoriteMovie() async {
    final Either<AppError, List<MovieEntity>> response =
        await getFavoriteMovies(NoParams());
    emit(response.fold(
        (l) => FavoriteMoviesError(), (r) => FavoriteMoviesLoaded(movies: r)));
  }

  void deleteMovie(int movieId) async {
    await deleteFavoriteMovie(MovieParams(id: movieId));
    loadFavoriteMovie();
  }

  void checkIfMovieFavorite(int movieId) async {
    final Either<AppError, bool> response =
        await checkIfFavoriteMovie(MovieParams(id: movieId));
    emit(response.fold((l) => FavoriteMoviesError(),
        (r) => IsFavoriteMovie(isMovieFavorite: r)));
  }
}

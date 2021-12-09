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

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final SaveMovie saveMovie;
  final GetFavoriteMovies getFavoriteMovies;
  final DeleteFavoriteMovie deleteFavoriteMovie;
  final CheckIfFavoriteMovie checkIfMovieIsFavorite;

  FavoriteBloc({
    required this.saveMovie,
    required this.getFavoriteMovies,
    required this.deleteFavoriteMovie,
    required this.checkIfMovieIsFavorite,
  }) : super(FavoriteInitial()) {
    on<FavoriteEvent>((event, emit) async {
      if (event is ToggleFavoriteMovieEvent) {
        if (event.isFavorite) {
          await deleteFavoriteMovie(MovieParams(id: event.movieEntity.id));
        } else {
          await saveMovie(event.movieEntity);
        }
        final response =
            await checkIfMovieIsFavorite(MovieParams(id: event.movieEntity.id));
        response.fold(
          (l) => emit(FavoriteMoviesError()),
          (r) => emit(IsFavoriteMovie(isMovieFavorite: r)),
        );
      } else if (event is LoadFavoriteEvent) {
        final responseState = await _fetchLoadFavoriteMovies().last;
        emit(responseState);
      } else if (event is DeleteFavoriteMovieEvent) {
        print("called with ${event.movieId}");
        await deleteFavoriteMovie(MovieParams(id: event.movieId));
        _fetchLoadFavoriteMovies();
      } else if (event is CheckIfMovieFavoriteEvent) {
        final response =
            await checkIfMovieIsFavorite(MovieParams(id: event.movieId));
        response.fold(
          (l) => emit(FavoriteMoviesError()),
          (r) => emit(IsFavoriteMovie(isMovieFavorite: r)),
        );
      }
    });
  }

  Stream<FavoriteState> _fetchLoadFavoriteMovies() async* {
    final Either<AppError, List<MovieEntity>> response =
        await getFavoriteMovies(NoParams());
    yield response.fold(
      (l) => FavoriteMoviesError(),
      (r) => FavoriteMoviesLoaded(movies: r),
    );
  }
}

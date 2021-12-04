import 'package:bloc/bloc.dart';
import 'package:clean_movies/domain/entities/movie_entity.dart';
import 'package:clean_movies/domain/usecases/check_if_favorite_movie.dart';
import 'package:clean_movies/domain/usecases/delete_favorite_movie.dart';
import 'package:clean_movies/domain/usecases/get_favorite_movies.dart';
import 'package:clean_movies/domain/usecases/save_movie.dart';
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
    on<FavoriteEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

import 'package:bloc/bloc.dart';
import 'package:clean_movies/domain/entities/app_error.dart';
import 'package:clean_movies/domain/entities/movie_entity.dart';
import 'package:clean_movies/domain/entities/movie_search_params.dart';
import 'package:clean_movies/domain/usecases/search_movies.dart';
import 'package:clean_movies/presentation/blocs/loading/loading_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'search_movies_event.dart';
part 'search_movies_state.dart';

class SearchMoviesBloc extends Bloc<SearchMoviesEvent, SearchMoviesState> {
  final SearchMovies searchMovies;
  final LoadingBloc loadingBloc;
  SearchMoviesBloc({required this.searchMovies, required this.loadingBloc})
      : super(SearchMoviesInitial()) {
    on<SearchMoviesEvent>((event, emit) async {
      if (event is SearchMovieEvent) {
        final Either<AppError, List<MovieEntity?>> eitherResponse =
            await searchMovies(MovieSearchParams(searchTerm: event.searchTerm));

        eitherResponse.fold(
            (l) => emit(SearchMoviesError(errorType: l.errorType)),
            (r) => emit(SearchMoviesCompleted(movies: r)));
      }
    });
  }
}

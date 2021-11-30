import 'package:bloc/bloc.dart';
import 'package:clean_movies/domain/entities/app_error.dart';
import 'package:clean_movies/domain/entities/movie_detail_entity.dart';
import 'package:clean_movies/domain/entities/movie_params.dart';
import 'package:clean_movies/domain/usecases/get_movie_detail.dart';
import 'package:clean_movies/presentation/blocs/cast/cast_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final GetMovieDetail getMovieDetail;
  final CastBloc castBloc;
  MovieDetailBloc({required this.getMovieDetail, required this.castBloc})
      : super(MovieDetailInitial()) {
    on<MovieDetailEvent>((event, emit) async {
      if (event is MovieDetailLoadEvent) {
        final Either<AppError, MovieDetailEntity?> eitherResponse =
            await getMovieDetail(MovieParams(id: event.movieId));
        eitherResponse.fold((l) => emit(MovieDetailError()),
            (r) => emit(MovieDetailLoaded(movieDetailEntity: r!)));
        castBloc.add(CastLoadEvent(movieId: event.movieId));
      }
    });
  }
}

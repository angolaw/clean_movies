import 'package:bloc/bloc.dart';
import 'package:clean_movies/domain/entities/app_error.dart';
import 'package:clean_movies/domain/entities/movie_detail_entity.dart';
import 'package:clean_movies/domain/entities/movie_params.dart';
import 'package:clean_movies/domain/usecases/get_movie_detail.dart';
import 'package:clean_movies/presentation/blocs/cast/cast_bloc.dart';
import 'package:clean_movies/presentation/blocs/favorite/favorite_bloc.dart';
import 'package:clean_movies/presentation/blocs/loading/loading_bloc.dart';
import 'package:clean_movies/presentation/blocs/videos/videos_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final GetMovieDetail getMovieDetail;
  final CastBloc castBloc;
  final VideosBloc videosBloc;
  final FavoriteBloc favoriteBloc;
  final LoadingBloc loadingBloc;
  MovieDetailBloc({
    required this.getMovieDetail,
    required this.castBloc,
    required this.videosBloc,
    required this.favoriteBloc,
    required this.loadingBloc,
  }) : super(MovieDetailInitial()) {
    on<MovieDetailEvent>((event, emit) async {
      if (event is MovieDetailLoadEvent) {
        loadingBloc.add(StartLoading());
        final Either<AppError, MovieDetailEntity?> eitherResponse =
            await getMovieDetail(MovieParams(id: event.movieId));
        eitherResponse.fold((l) => emit(MovieDetailError()),
            (r) => emit(MovieDetailLoaded(movieDetailEntity: r!)));
        castBloc.add(CastLoadEvent(movieId: event.movieId));
        videosBloc.add(LoadedVideosEvent(movieId: event.movieId));
        favoriteBloc.add(CheckIfMovieFavoriteEvent(movieId: event.movieId));
        loadingBloc.add(FinishLoading());
      }
    });
  }
}

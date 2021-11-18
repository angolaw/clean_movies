import 'package:bloc/bloc.dart';
import 'package:clean_movies/domain/entities/app_error.dart';
import 'package:clean_movies/domain/entities/movie_entity.dart';
import 'package:clean_movies/domain/usecases/get_coming_soon.dart';
import 'package:clean_movies/domain/usecases/get_playing_now.dart';
import 'package:clean_movies/domain/usecases/get_popular.dart';
import 'package:clean_movies/domain/usecases/no_params.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'movietab_event.dart';
part 'movietab_state.dart';

class MovieTabBloc extends Bloc<MovieTabEvent, MovieTabState> {
  final GetPopular getPopular;
  final GetPlayingNow getPlayingNow;
  final GetComingSoon getComingSoon;
  MovieTabBloc(
      {required this.getPopular,
      required this.getPlayingNow,
      required this.getComingSoon})
      : super(MovieTabbedInitial()) {
    on<MovieTabEvent>((event, emit) async {
      if (event is MovieTabChangedEvent) {
        Either<AppError, List<MovieEntity?>>? moviesEither;
        switch (event.currentTabIndex) {
          case 0:
            moviesEither = await getPopular(NoParams());
            break;
          case 1:
            moviesEither = await getPlayingNow(NoParams());
            break;
          case 2:
            moviesEither = await getComingSoon(NoParams());
            break;
        }
        moviesEither?.fold(
            (l) =>
                emit(MovieTabLoadError(currentTabIndex: event.currentTabIndex)),
            (movies) {
          emit(MovieTabChanged(
              movies: movies, currentTabIndex: event.currentTabIndex));
        });
      }
    });
  }
}

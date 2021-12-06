import 'package:bloc/bloc.dart';
import 'package:clean_movies/domain/entities/app_error.dart';
import 'package:clean_movies/domain/entities/movie_entity.dart';
import 'package:clean_movies/domain/usecases/get_trending.dart';
import 'package:clean_movies/domain/usecases/no_params.dart';
import 'package:clean_movies/presentation/blocs/loading/loading_bloc.dart';
import 'package:clean_movies/presentation/blocs/movie_backdrop/moviebackdrop_bloc.dart';
import 'package:equatable/equatable.dart';

part 'moviecarousel_event.dart';
part 'moviecarousel_state.dart';

class MoviecarouselBloc extends Bloc<MovieCarouselEvent, MoviecarouselState> {
  final GetTrending getTrending;
  final MoviebackdropBloc movieBackdropBloc;
  final LoadingBloc loadingBloc;
  MoviecarouselBloc(
      {required this.movieBackdropBloc,
      required this.getTrending,
      required this.loadingBloc})
      : super(MoviecarouselInitial()) {
    on<MovieCarouselEvent>((event, emit) async {
      if (event is CarouselLoadEvent) {
        loadingBloc.add(StartLoading());
        final moviesEither = await getTrending(NoParams());
        moviesEither.fold(
            (l) => emit(MovieCarouselError(errorType: l.errorType)), (movies) {
          movieBackdropBloc.add(
              MovieBackdropChangedEvent(movie: movies[event.defaultIndex]!));
          emit(MovieCarouselLoaded(
              movies: movies, defaultIndex: event.defaultIndex));
          loadingBloc.add(FinishLoading());
        });
      }
    });
  }
}

import 'package:bloc/bloc.dart';
import 'package:clean_movies/domain/entities/movie_entity.dart';
import 'package:clean_movies/domain/usecases/get_trending.dart';
import 'package:clean_movies/domain/usecases/no_params.dart';
import 'package:clean_movies/presentation/blocs/movie_backdrop/moviebackdrop_bloc.dart';
import 'package:equatable/equatable.dart';

part 'moviecarousel_event.dart';
part 'moviecarousel_state.dart';

class MoviecarouselBloc extends Bloc<MovieCarouselEvent, MoviecarouselState> {
  final GetTrending getTrending;
  final MoviebackdropBloc movieBackdropBloc;
  MoviecarouselBloc(
      {required this.movieBackdropBloc, required this.getTrending})
      : super(MoviecarouselInitial()) {
    on<MovieCarouselEvent>((event, emit) async {
      if (event is CarouselLoadEvent) {
        final moviesEither = await getTrending(NoParams());
        moviesEither.fold((l) => emit(MovieCarouselError()), (movies) {
          movieBackdropBloc.add(
              MovieBackdropChangedEvent(movie: movies[event.defaultIndex]!));
          emit(MovieCarouselLoaded(
              movies: movies, defaultIndex: event.defaultIndex));
        });
      }
    });
  }
}

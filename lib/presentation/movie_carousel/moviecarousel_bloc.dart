import 'package:bloc/bloc.dart';
import 'package:clean_movies/domain/entities/movie_entity.dart';
import 'package:clean_movies/domain/usecases/get_trending.dart';
import 'package:clean_movies/domain/usecases/no_params.dart';
import 'package:equatable/equatable.dart';

part 'moviecarousel_event.dart';
part 'moviecarousel_state.dart';

class MoviecarouselBloc extends Bloc<MovieCarouselEvent, MoviecarouselState> {
  final GetTrending getTrending;
  MoviecarouselBloc({required this.getTrending})
      : super(MoviecarouselInitial()) {
    on<MovieCarouselEvent>((event, emit) async {});
  }
}

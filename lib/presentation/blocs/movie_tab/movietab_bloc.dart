import 'package:bloc/bloc.dart';
import 'package:clean_movies/domain/entities/movie_entity.dart';
import 'package:clean_movies/domain/usecases/get_coming_soon.dart';
import 'package:clean_movies/domain/usecases/get_playing_now.dart';
import 'package:clean_movies/domain/usecases/get_popular.dart';
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
      : super(MovieTabInitial()) {
    on<MovieTabEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

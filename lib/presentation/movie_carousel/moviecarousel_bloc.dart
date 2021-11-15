import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'moviecarousel_event.dart';
part 'moviecarousel_state.dart';

class MoviecarouselBloc extends Bloc<MoviecarouselEvent, MoviecarouselState> {
  MoviecarouselBloc() : super(MoviecarouselInitial()) {
    on<MoviecarouselEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

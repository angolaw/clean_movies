import 'package:bloc/bloc.dart';
import 'package:clean_movies/domain/entities/app_error.dart';
import 'package:clean_movies/domain/entities/cast_entity.dart';
import 'package:clean_movies/domain/entities/movie_params.dart';
import 'package:clean_movies/domain/usecases/get_cast.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'cast_event.dart';
part 'cast_state.dart';

class CastBloc extends Bloc<CastEvent, CastState> {
  final GetCast getCast;
  CastBloc({required this.getCast}) : super(CastInitial()) {
    on<CastEvent>((event, emit) async {
      if (event is CastLoadEvent) {
        final Either<AppError, List<CastEntity?>> eitherResponse =
            await getCast(MovieParams(id: event.movieId));

        eitherResponse.fold(
            (l) => emit(CastError()), (cast) => emit(CastLoaded(cast: cast)));
      }
    });
  }
}

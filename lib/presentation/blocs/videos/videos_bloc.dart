import 'package:bloc/bloc.dart';
import 'package:clean_movies/domain/entities/app_error.dart';
import 'package:clean_movies/domain/entities/movie_entity.dart';
import 'package:clean_movies/domain/entities/movie_params.dart';
import 'package:clean_movies/domain/entities/video_entity.dart';
import 'package:clean_movies/domain/usecases/get_videos.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'videos_event.dart';
part 'videos_state.dart';

class VideosBloc extends Bloc<VideosEvent, VideosState> {
  final GetVideos getVideos;
  VideosBloc({required this.getVideos}) : super(VideosInitial()) {
    on<VideosEvent>((event, emit) async {
      if (event is LoadedVideosEvent) {
        final Either<AppError, List<VideoEntity?>> eitherResponse =
            await getVideos(MovieParams(id: event.movieId));
        eitherResponse.fold((error) => emit(NoVideos()),
            (videos) => emit(VideosLoaded(videos: videos)));
      }
    });
  }
}

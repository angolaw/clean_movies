import 'package:clean_movies/domain/entities/app_error.dart';
import 'package:clean_movies/domain/entities/movie_params.dart';
import 'package:clean_movies/domain/entities/video_entity.dart';
import 'package:clean_movies/domain/repositories/movie_repository.dart';
import 'package:dartz/dartz.dart';

import '../usecase.dart';

class GetVideos extends UseCase<List<VideoEntity?>, MovieParams> {
  final MovieRepository repository;

  GetVideos({required this.repository});

  @override
  Future<Either<AppError, List<VideoEntity?>>> call(MovieParams params) async {
    return await repository.getVideos(params.id);
  }
}

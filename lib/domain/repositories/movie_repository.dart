import 'package:clean_movies/domain/entities/app_error.dart';
import 'package:clean_movies/domain/entities/movie_entity.dart';
import 'package:dartz/dartz.dart';

abstract class MovieRepository {
  Future<Either<AppError, List<MovieEntity?>>> getTrending();
  Future<Either<AppError, List<MovieEntity?>>> getPopular();
  Future<Either<AppError, List<MovieEntity?>>> getPlayingNow();
  Future<Either<AppError, List<MovieEntity?>>> getComingSoon();
}

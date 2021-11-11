import 'package:clean_movies/domain/entities/app_error.dart';
import 'package:clean_movies/domain/entities/movie_entity.dart';
import 'package:clean_movies/domain/repositories/movie_repository.dart';
import 'package:dartz/dartz.dart';

class GetTrending {
  final MovieRepository repository;
  GetTrending(this.repository);
  Future<Either<AppError, List<MovieEntity?>>> call() async {
    return await repository.getTrending();
  }
}

import 'package:clean_movies/domain/entities/app_error.dart';
import 'package:clean_movies/domain/entities/movie_entity.dart';
import 'package:clean_movies/domain/repositories/movie_repository.dart';
import 'package:dartz/dartz.dart';

import '../usecase.dart';

class SaveMovie extends UseCase<void, MovieEntity> {
  final MovieRepository repository;

  SaveMovie({required this.repository});
  @override
  Future<Either<AppError, void>> call(MovieEntity params) async {
    return await repository.saveMovie(params);
  }
}

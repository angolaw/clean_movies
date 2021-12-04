import 'package:clean_movies/domain/entities/app_error.dart';
import 'package:clean_movies/domain/entities/movie_params.dart';
import 'package:clean_movies/domain/repositories/movie_repository.dart';
import 'package:dartz/dartz.dart';

import '../usecase.dart';

class DeleteFavoriteMovie extends UseCase<void, MovieParams> {
  final MovieRepository repository;

  DeleteFavoriteMovie({required this.repository});
  @override
  Future<Either<AppError, void>> call(MovieParams params) async {
    return await repository.deleteFavoriteMovie(params.id);
  }
}

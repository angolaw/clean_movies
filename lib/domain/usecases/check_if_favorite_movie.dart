import 'package:clean_movies/domain/entities/movie_params.dart';
import 'package:clean_movies/domain/repositories/movie_repository.dart';
import 'package:dartz/dartz.dart';

import 'package:clean_movies/domain/entities/app_error.dart';

import '../usecase.dart';

class CheckIfFavoriteMovie extends UseCase<bool, MovieParams> {
  final MovieRepository repository;

  CheckIfFavoriteMovie({required this.repository});

  @override
  Future<Either<AppError, bool>> call(params) async {
    return await repository.checkIfMovieFavorite(params.id);
  }
}

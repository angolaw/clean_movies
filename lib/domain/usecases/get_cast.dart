import 'package:clean_movies/domain/entities/app_error.dart';
import 'package:clean_movies/domain/entities/cast_entity.dart';
import 'package:clean_movies/domain/entities/movie_params.dart';
import 'package:clean_movies/domain/repositories/movie_repository.dart';
import 'package:dartz/dartz.dart';

import '../usecase.dart';

class GetCast extends UseCase<List<CastEntity?>, MovieParams> {
  final MovieRepository repository;

  GetCast({required this.repository});

  @override
  Future<Either<AppError, List<CastEntity?>>> call(MovieParams params) async {
    return await repository.getCastCrew(params.id);
  }
}

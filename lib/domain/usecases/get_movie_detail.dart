import 'package:clean_movies/domain/entities/app_error.dart';
import 'package:clean_movies/domain/entities/movie_detail_entity.dart';
import 'package:clean_movies/domain/entities/movie_params.dart';
import 'package:clean_movies/domain/repositories/movie_repository.dart';
import 'package:dartz/dartz.dart';

import '../usecase.dart';

class GetMovieDetail extends UseCase<MovieDetailEntity?, MovieParams> {
  final MovieRepository repository;

  GetMovieDetail({required this.repository});

  @override
  Future<Either<AppError, MovieDetailEntity?>> call(MovieParams params) async {
    return await repository.getMovieDetail(params.id);
  }
}

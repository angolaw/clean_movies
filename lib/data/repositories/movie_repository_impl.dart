import 'package:clean_movies/data/datasources/movie_remote_data_source.dart';
import 'package:clean_movies/domain/entities/movie_entity.dart';
import 'package:clean_movies/domain/entities/app_error.dart';
import 'package:clean_movies/domain/repositories/movie_repository.dart';
import 'package:dartz/dartz.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource remoteDataSource;
  MovieRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<AppError, List<MovieEntity?>>> getTrending() async {
    try {
      final movies = await remoteDataSource.getTrending();
      return right(movies);
    } on Exception {
      return left(const AppError("Algo deu errado"));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity?>>> getComingSoon() async {
    try {
      final movies = await remoteDataSource.getComingSoon();
      return right(movies);
    } on Exception {
      return left(const AppError("Algo deu errado"));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity?>>> getPlayingNow() async {
    try {
      final movies = await remoteDataSource.getPlayingNow();
      return right(movies);
    } on Exception {
      return left(const AppError("Algo deu errado"));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity?>>> getPopular() async {
    try {
      final movies = await remoteDataSource.getPopular();
      return right(movies);
    } on Exception {
      return left(const AppError("Algo deu errado"));
    }
  }
}

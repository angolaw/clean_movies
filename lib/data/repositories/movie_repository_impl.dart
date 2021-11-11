import 'package:clean_movies/data/datasources/movie_remote_data_source.dart';
import 'package:clean_movies/data/models/movie_model.dart';
import 'package:clean_movies/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource remoteDataSource;
  MovieRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<MovieModel?>> getTrending() async {
    try {
      final movies = await remoteDataSource.getTrending();
      return movies;
    } on Exception {
      //return null;
      throw Exception();
    }
  }
}

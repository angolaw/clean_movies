import 'package:clean_movies/data/core/api_client.dart';
import 'package:clean_movies/data/models/movie_model.dart';
import 'package:clean_movies/data/models/movie_result_model.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel?>> getTrending();
  Future<List<MovieModel?>> getPopular();
}

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final ApiClient _client;

  MovieRemoteDataSourceImpl(this._client);

  @override
  Future<List<MovieModel?>> getTrending() async {
    final response = await _client.get('trending/movie/day');
    final movies = MoviesResultModel.fromJson(response).movies;
    print(movies);
    return movies!;
  }

  @override
  Future<List<MovieModel?>> getPopular() async {
    final response = await _client.get('movie/popular');
    final movies = MoviesResultModel.fromJson(response).movies;
    print(movies);
    return movies!;
  }
}

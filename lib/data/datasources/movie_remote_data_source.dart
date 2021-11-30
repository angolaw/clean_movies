import 'package:clean_movies/data/core/api_client.dart';
import 'package:clean_movies/data/models/cast_crew_result_model.dart';
import 'package:clean_movies/data/models/movie_detail_model.dart';
import 'package:clean_movies/data/models/movie_model.dart';
import 'package:clean_movies/data/models/movie_result_model.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel?>> getTrending();
  Future<List<MovieModel?>> getPopular();
  Future<List<MovieModel?>> getPlayingNow();
  Future<List<MovieModel?>> getComingSoon();
  Future<MovieDetailModel> getMovieDetail(int id);
  Future<List<CastModel?>> getCastCrew(int id);
}

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final ApiClient _client;

  MovieRemoteDataSourceImpl(this._client);

  @override
  Future<List<MovieModel?>> getTrending() async {
    final response = await _client.get('trending/movie/day');
    final movies = MoviesResultModel.fromJson(response).movies;
    return movies!;
  }

  @override
  Future<List<MovieModel?>> getPopular() async {
    final response = await _client.get('movie/popular');
    final movies = MoviesResultModel.fromJson(response).movies;
    return movies!;
  }

  @override
  Future<List<MovieModel?>> getPlayingNow() async {
    final response = await _client.get('movie/now_playing');
    final movies = MoviesResultModel.fromJson(response).movies;
    return movies!;
  }

  @override
  Future<List<MovieModel?>> getComingSoon() async {
    final response = await _client.get('movie/upcoming');
    final movies = MoviesResultModel.fromJson(response).movies;
    return movies!;
  }

  @override
  Future<MovieDetailModel> getMovieDetail(int id) async {
    final response = await _client.get('movie/$id');
    final movie = MovieDetailModel.fromJson(response);
    print(movie);
    return movie;
  }

  @override
  Future<List<CastModel?>> getCastCrew(int id) async {
    final response = await _client.get('movie/$id/credits');
    final cast = CastCrewResultModel.fromJson(response).cast;
    return cast;
  }
}

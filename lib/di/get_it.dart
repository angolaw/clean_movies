import 'package:clean_movies/data/core/api_client.dart';
import 'package:clean_movies/data/datasources/movie_local_data_source.dart';
import 'package:clean_movies/data/datasources/movie_remote_data_source.dart';
import 'package:clean_movies/data/repositories/movie_repository_impl.dart';
import 'package:clean_movies/domain/repositories/movie_repository.dart';
import 'package:clean_movies/domain/usecases/get_cast.dart';
import 'package:clean_movies/domain/usecases/get_coming_soon.dart';
import 'package:clean_movies/domain/usecases/get_favorite_movies.dart';
import 'package:clean_movies/domain/usecases/get_movie_detail.dart';
import 'package:clean_movies/domain/usecases/get_playing_now.dart';
import 'package:clean_movies/domain/usecases/get_popular.dart';
import 'package:clean_movies/domain/usecases/get_trending.dart';
import 'package:clean_movies/domain/usecases/get_videos.dart';
import 'package:clean_movies/domain/usecases/save_movie.dart';
import 'package:clean_movies/domain/usecases/search_movies.dart';
import 'package:clean_movies/presentation/blocs/cast/cast_bloc.dart';
import 'package:clean_movies/presentation/blocs/language_bloc/language_bloc.dart';
import 'package:clean_movies/presentation/blocs/movie_backdrop/moviebackdrop_bloc.dart';
import 'package:clean_movies/presentation/blocs/movie_carousel/moviecarousel_bloc.dart';
import 'package:clean_movies/presentation/blocs/movie_detail/movie_detail_bloc.dart';
import 'package:clean_movies/presentation/blocs/movie_tab/movietab_bloc.dart';
import 'package:clean_movies/presentation/blocs/search_movies/search_movies_bloc.dart';
import 'package:clean_movies/presentation/blocs/videos/videos_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

final getItInstance = GetIt.I;

Future init() async {
  //first dependency - httpClient to ApiClient
  getItInstance.registerLazySingleton<Client>(() => Client());
  getItInstance
      .registerLazySingleton<ApiClient>(() => ApiClient(getItInstance()));
  //movieRemoteDataSource
  getItInstance.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(getItInstance()));
  //usecases
  getItInstance
      .registerLazySingleton<GetTrending>(() => GetTrending(getItInstance()));
  getItInstance
      .registerLazySingleton<GetPopular>(() => GetPopular(getItInstance()));
  getItInstance.registerLazySingleton<GetPlayingNow>(
      () => GetPlayingNow(getItInstance()));
  getItInstance.registerLazySingleton<GetComingSoon>(
      () => GetComingSoon(getItInstance()));
  // movieLocalDataSource
  getItInstance.registerLazySingleton<MovieLocalDataSource>(
      () => MovieLocalDataSourceImpl());

  //movie repository
  getItInstance.registerLazySingleton<MovieRepository>(() =>
      MovieRepositoryImpl(
          remoteDataSource: getItInstance(), localDataSource: getItInstance()));
  //registrando o bloc
  getItInstance.registerFactory(() => MoviebackdropBloc());
  //registrando o movieBackdropBloc

  getItInstance.registerFactory(() => MoviecarouselBloc(
      getTrending: getItInstance(), movieBackdropBloc: getItInstance()));
  //registrando o MovieTabBloc
  getItInstance.registerFactory(() => MovieTabBloc(
        getPopular: getItInstance(),
        getPlayingNow: getItInstance(),
        getComingSoon: getItInstance(),
      ));

  getItInstance.registerSingleton<LanguageBloc>(LanguageBloc());
  getItInstance.registerLazySingleton<GetMovieDetail>(
      () => GetMovieDetail(repository: getItInstance()));

  //register getCast usecase
  getItInstance.registerLazySingleton<GetCast>(
      () => GetCast(repository: getItInstance()));

  //register cast bloc
  getItInstance
      .registerFactory<CastBloc>(() => CastBloc(getCast: getItInstance()));
  //register videosBloc
  getItInstance.registerFactory<VideosBloc>(
      () => VideosBloc(getVideos: getItInstance()));
  //register usecase
  getItInstance.registerLazySingleton<GetVideos>(
      () => GetVideos(repository: getItInstance()));
  getItInstance.registerFactory<MovieDetailBloc>(() => MovieDetailBloc(
      videosBloc: getItInstance(),
      getMovieDetail: getItInstance(),
      castBloc: getItInstance()));

  //! SEARCH FEATURE

  //* PARA USECASES - registerLazySingleton
  //* PARA BLOCS
  getItInstance.registerLazySingleton<SearchMovies>(
      () => SearchMovies(repository: getItInstance()));
  getItInstance.registerFactory<SearchMoviesBloc>(
      () => SearchMoviesBloc(searchMovies: getItInstance()));

  //! LOCAL DATA USECASES
  getItInstance.registerLazySingleton<SaveMovie>(
      () => SaveMovie(repository: getItInstance()));
  getItInstance.registerLazySingleton<GetFavoriteMovies>(
      () => GetFavoriteMovies(repository: getItInstance()));
}

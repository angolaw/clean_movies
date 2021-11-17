import 'package:clean_movies/data/core/api_client.dart';
import 'package:clean_movies/data/datasources/movie_remote_data_source.dart';
import 'package:clean_movies/data/repositories/movie_repository_impl.dart';
import 'package:clean_movies/domain/repositories/movie_repository.dart';
import 'package:clean_movies/domain/usecases/get_coming_soon.dart';
import 'package:clean_movies/domain/usecases/get_playing_now.dart';
import 'package:clean_movies/domain/usecases/get_popular.dart';
import 'package:clean_movies/domain/usecases/get_trending.dart';
import 'package:clean_movies/presentation/blocs/movie_backdrop/moviebackdrop_bloc.dart';
import 'package:clean_movies/presentation/blocs/movie_carousel/moviecarousel_bloc.dart';
import 'package:clean_movies/presentation/blocs/movie_tab/movietab_bloc.dart';
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
  //movie repository
  getItInstance.registerLazySingleton<MovieRepository>(
      () => MovieRepositoryImpl(getItInstance()));
  //registrando o bloc
  getItInstance.registerFactory(() => MoviebackdropBloc());
  //registrando o movieBackdropBloc

  getItInstance.registerFactory(() => MoviecarouselBloc(
      getTrending: getItInstance(), movieBackdropBloc: getItInstance()));
  //registrando o MovieTabBloc
  getItInstance.registerFactory(() => MovieTabBloc(
        getPopular: GetPopular(getItInstance()),
        getPlayingNow: GetPlayingNow(getItInstance()),
        getComingSoon: GetComingSoon(getItInstance()),
      ));
}

import 'package:clean_movies/domain/usecases/get_coming_soon.dart';
import 'package:clean_movies/domain/usecases/get_playing_now.dart';
import 'package:clean_movies/domain/usecases/get_popular.dart';
import 'package:clean_movies/domain/usecases/no_params.dart';
import 'package:clean_movies/presentation/blocs/movie_tab/movietab_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/mockito.dart';

class GetPopularMock extends Mock implements GetPopular {}

class GetPlayingNowMock extends Mock implements GetPlayingNow {}

class GetComingSoonMock extends Mock implements GetComingSoon {}

//main function
GetPopularMock? getPopularMock;
GetPlayingNowMock? getPlayingNow;
GetComingSoonMock? getComingSoon;
MovieTabBloc? movieTabBloc;
void main() {
  setUp(() {
    getPopularMock = GetPopularMock();
    getPlayingNow = GetPlayingNowMock();
    getComingSoon = GetComingSoonMock();
    movieTabBloc = MovieTabBloc(
      getPopular: getPopularMock as GetPopular,
      getPlayingNow: getPlayingNow as GetPlayingNow,
      getComingSoon: getComingSoon as GetComingSoon,
    );
  });

  tearDown(() {
    movieTabBloc?.close();
  });

  test('should have initial state as MovieTabbedInitial', () {
    expect(movieTabBloc?.state.runtimeType, MovieTabbedInitial);
  });

  blocTest<MovieTabBloc, MovieTabState>(
      'should emit [MovieTabLoading, MovieTabChanged] states when playing now tab changes successfully',
      build: () => movieTabBloc!,
      act: (MovieTabBloc? movieTabBloc) {
        when(getPlayingNow?.call(NoParams()))
            .thenAnswer((_) async => const Right([]));
        movieTabBloc?.add(const MovieTabChangedEvent(currentTabIndex: 1));
      },
      expect: () => [isA<MovieTabLoading>(), isA<MovieTabChanged>()],
      verify: (MovieTabBloc? movieTabBloc) {
        verify(getPlayingNow?.call(NoParams()));
      });
}

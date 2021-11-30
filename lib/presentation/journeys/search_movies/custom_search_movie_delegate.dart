import 'package:clean_movies/common/constants/size_constants.dart';
import 'package:clean_movies/common/constants/translation_constants.dart';
import 'package:clean_movies/common/extensions/size_extension.dart';
import 'package:clean_movies/common/extensions/string_extensions.dart';
import 'package:clean_movies/domain/entities/app_error.dart';
import 'package:clean_movies/presentation/blocs/search_movies/search_movies_bloc.dart';
import 'package:clean_movies/presentation/journeys/search_movies/search_movie_card.dart';
import 'package:clean_movies/presentation/themes/app_color.dart';
import 'package:clean_movies/presentation/themes/theme_text.dart';
import 'package:clean_movies/presentation/widgets/app_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSearchDelegate extends SearchDelegate {
  final SearchMoviesBloc searchMoviesBloc;

  CustomSearchDelegate({required this.searchMoviesBloc});
  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
        inputDecorationTheme: InputDecorationTheme(
      hintStyle: Theme.of(context).textTheme.greySubtitle1,
    ));
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      //1
      IconButton(
        icon: Icon(
          Icons.clear,
          //2
          color: query.isEmpty ? Colors.grey : AppColor.royalBlue,
        ),
        //3
        onPressed: query.isEmpty ? null : () => query = '',
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return GestureDetector(
      onTap: () {
        close(context, null);
      },
      child: Icon(
        Icons.arrow_back_ios,
        color: Colors.white,
        size: Sizes.dimen_12.h.toDouble(),
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    //1
    searchMoviesBloc.add(
      SearchMovieEvent(searchTerm: query),
    );

    //2
    return BlocBuilder<SearchMoviesBloc, SearchMoviesState>(
      bloc: searchMoviesBloc,
      builder: (context, state) {
        //3
        if (state is SearchMoviesError) {
          //4
          return AppErrorWidget(
            errorType: AppErrorType.api,
            onPressed: () =>
                searchMoviesBloc.add(SearchMovieEvent(searchTerm: query)),
          );
        }
        //3
        else if (state is SearchMoviesCompleted) {
          final movies = state.movies;
          //6
          if (movies.isEmpty) {
            return Center(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Sizes.dimen_64.w.toDouble(),
                ),
                child: Text(
                  TranslationsConstants.noMoviesSearched.t(context),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }
          //7
          return ListView.builder(
            itemBuilder: (context, index) => SearchMovieCard(
              movie: movies[index]!,
            ),
            itemCount: movies.length,
            scrollDirection: Axis.vertical,
          );
        }
        //3
        else {
          //5
          return const SizedBox.shrink();
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return SizedBox.shrink();
  }
}

import 'package:clean_movies/common/constants/size_constants.dart';
import 'package:clean_movies/common/extensions/size_extension.dart';
import 'package:clean_movies/presentation/blocs/search_movies/search_movies_bloc.dart';
import 'package:clean_movies/presentation/themes/app_color.dart';
import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate {
  final SearchMoviesBloc searchMoviesBloc;

  CustomSearchDelegate({required this.searchMoviesBloc});
  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
        inputDecorationTheme: InputDecorationTheme(
      hintStyle: Theme.of(context).textTheme.subtitle1,
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
    return SizedBox.shrink();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return SizedBox.shrink();
  }
}

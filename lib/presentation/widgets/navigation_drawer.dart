import 'package:clean_movies/common/constants/languages.dart';
import 'package:clean_movies/common/constants/size_constants.dart';
import 'package:clean_movies/common/constants/translation_constants.dart';
import 'package:clean_movies/common/extensions/size_extension.dart';
import 'package:clean_movies/common/extensions/string_extensions.dart';
import 'package:clean_movies/domain/app_localizations.dart';
import 'package:clean_movies/presentation/blocs/bloc/language_bloc.dart';
import 'package:clean_movies/presentation/journeys/drawer/navigation_expanded_list_item.dart';
import 'package:clean_movies/presentation/journeys/drawer/navigation_list_item.dart';
import 'package:clean_movies/presentation/themes/app_color.dart';
import 'package:clean_movies/presentation/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wiredash/wiredash.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Sizes.dimen_300.w.toDouble(),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Theme.of(context).primaryColor.withOpacity(0.7),
              blurRadius: 4),
        ],
      ),
      child: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: Sizes.dimen_8.h.toDouble(),
                left: Sizes.dimen_8.w.toDouble(),
                right: Sizes.dimen_8.h.toDouble(),
                bottom: Sizes.dimen_8.h.toDouble()),
            child: Logo(
              height: Sizes.dimen_20.h.toDouble(),
            ),
          ),
          //1
          NavigationListItem(
            title: TranslationsConstants.favoriteMovies.t(context),
            onPressed: () {},
          ),
          NavigationExpandedListItem(
            title: TranslationsConstants.language.t(context),
            //1
            children: Languages.languages.map((e) => e.value).toList(),
            onPressed: (index) {
              BlocProvider.of<LanguageBloc>(context).add(
                  ToggleLanguageEvent(language: Languages.languages[index]));
            },
          ),
          NavigationListItem(
            title: TranslationsConstants.feedback.t(context),
            onPressed: () {
              print("ON");
              Navigator.of(context).pop();
              Wiredash.of(context)?.show();
            },
          ),
          NavigationListItem(
            title: TranslationsConstants.about.t(context),
            onPressed: () {
              Navigator.of(context).pop();
              _showDialog(context);
            },
          ),
        ],
      )),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            backgroundColor: AppColor.vulcan,
            elevation: Sizes.dimen_32.toDouble(),
            insetPadding: EdgeInsets.all(Sizes.dimen_32.w.toDouble()),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                    Radius.circular(Sizes.dimen_8.w.toDouble()))),
          );
        });
  }
}

class AppDialog extends StatelessWidget {
  final String title, description, buttonText;
  final Widget? image;

  const AppDialog(
      {Key? key,
      required this.title,
      required this.description,
      required this.buttonText,
      this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

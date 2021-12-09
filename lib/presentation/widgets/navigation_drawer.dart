import 'package:clean_movies/common/constants/languages.dart';
import 'package:clean_movies/common/constants/size_constants.dart';
import 'package:clean_movies/common/constants/translation_constants.dart';
import 'package:clean_movies/common/extensions/size_extension.dart';
import 'package:clean_movies/common/extensions/string_extensions.dart';
import 'package:clean_movies/common/route_list.dart';
import 'package:clean_movies/presentation/blocs/language/language_cubit.dart';
import 'package:clean_movies/presentation/blocs/language_bloc/language_bloc.dart';
import 'package:clean_movies/presentation/blocs/login/login_bloc.dart';
import 'package:clean_movies/presentation/blocs/theme/theme_cubit.dart';
import 'package:clean_movies/presentation/journeys/drawer/navigation_expanded_list_item.dart';
import 'package:clean_movies/presentation/journeys/drawer/navigation_list_item.dart';
import 'package:clean_movies/presentation/themes/app_color.dart';
import 'package:clean_movies/presentation/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wiredash/wiredash.dart';

import 'app_dialog.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Sizes.dimen_300.w,
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
                top: Sizes.dimen_8.h,
                left: Sizes.dimen_8.w,
                right: Sizes.dimen_8.h,
                bottom: Sizes.dimen_8.h),
            child: Logo(
              height: Sizes.dimen_20.h,
            ),
          ),
          //1
          NavigationListItem(
            title: TranslationsConstants.favoriteMovies.t(context),
            onPressed: () {
              Navigator.of(context).pushNamed(RouteList.favorite);
            },
          ),
          NavigationExpandedListItem(
            title: TranslationsConstants.language.t(context),
            //1
            children: Languages.languages.map((e) => e.value).toList(),
            onPressed: (index) => _onLanguageSelected(index, context),
          ),
          NavigationListItem(
            title: TranslationsConstants.feedback.t(context),
            onPressed: () {
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
          BlocListener<LoginBloc, LoginState>(
            listenWhen: (previous, current) => current is LogoutSuccess,
            listener: (context, state) {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(RouteList.initial, (route) => false);
            },
            child: NavigationListItem(
              title: TranslationsConstants.logout.t(context),
              onPressed: () {
                BlocProvider.of<LoginBloc>(context).add(LogoutEvent());
              },
            ),
          ),
          BlocBuilder<ThemeCubit, Themes>(builder: (context, theme) {
            return Align(
              alignment: Alignment.center,
              child: IconButton(
                //2
                onPressed: () => context.read<ThemeCubit>().toggleTheme(),
                icon: Icon(
                  //3
                  theme == Themes.dark
                      ? Icons.brightness_4_sharp
                      : Icons.brightness_7_sharp,
                  color: context.read<ThemeCubit>().state == Themes.dark
                      ? Colors.white
                      : AppColor.vulcan,
                  size: Sizes.dimen_40.w,
                ),
              ),
            );
          })
        ],
      )),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AppDialog(
            title: TranslationsConstants.about,
            description: TranslationsConstants.aboutDescription,
            buttonText: TranslationsConstants.okay,
            image: Image.asset(
              'assets/pngs/tmdb_logo.png',
              height: Sizes.dimen_32.h,
            ),
          );
        });
  }

  _onLanguageSelected(int index, BuildContext context) {
    BlocProvider.of<LanguageCubit>(context)
        .toggleLanguage(Languages.languages[index]);
  }
}

import 'package:clean_movies/common/constants/languages.dart';
import 'package:clean_movies/common/screenutil/screen_util.dart';
import 'package:clean_movies/di/get_it.dart';
import 'package:clean_movies/domain/app_localizations.dart';
import 'package:clean_movies/presentation/themes/app_color.dart';
import 'package:clean_movies/presentation/themes/theme_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:wiredash/wiredash.dart';

import 'blocs/language_bloc/language_bloc.dart';
import 'journeys/home/home_screen.dart';

class MovieApp extends StatefulWidget {
  const MovieApp({Key? key}) : super(key: key);

  @override
  State<MovieApp> createState() => _MovieAppState();
}

class _MovieAppState extends State<MovieApp> {
  LanguageBloc? _languageBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _languageBloc = getItInstance<LanguageBloc>();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _languageBloc?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(width: 414, height: 896);
    final _navigatorKey = GlobalKey<NavigatorState>();
    return BlocProvider<LanguageBloc>.value(
      value: _languageBloc!,
      child: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, state) {
          if (state is LanguageLoaded) {
            return WiredashApp(
              navigatorKey: _navigatorKey,
              languageCode: state.locale.languageCode,
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                supportedLocales:
                    Languages.languages.map((e) => Locale(e.code)).toList(),
                locale: state.locale,
                localizationsDelegates: const [
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  AppLocalizations.delegate,
                ],
                title: 'Movie App',
                navigatorKey: _navigatorKey,
                theme: ThemeData(
                  primaryColor: AppColor.vulcan,
                  scaffoldBackgroundColor: AppColor.vulcan,
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                  textTheme: ThemeText.getTextTheme(),
                  appBarTheme: const AppBarTheme(elevation: 0),
                ),
                home: HomeScreen(),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}

class WiredashApp extends StatelessWidget {
  final navigatorKey;
  final Widget child;
  final String languageCode;

  const WiredashApp({
    Key? key,
    required this.navigatorKey,
    required this.child,
    required this.languageCode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wiredash(
      projectId: 'movie-app-tutorial-k1xtma1',
      secret: 'wsmigg476q5l4k9mz2njmob4puuuwt58',
      navigatorKey: navigatorKey,
      child: child,
      options: WiredashOptionsData(
        locale: Locale.fromSubtags(
          languageCode: languageCode,
        ),
      ),
      theme: WiredashThemeData(
        brightness: Brightness.dark,
        primaryColor: AppColor.royalBlue,
        secondaryColor: AppColor.vulcan,
        secondaryBackgroundColor: AppColor.vulcan,
        dividerColor: AppColor.vulcan,
      ),
    );
  }
}

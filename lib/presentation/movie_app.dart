import 'package:clean_movies/common/constants/languages.dart';
import 'package:clean_movies/common/fade_page_route_builder.dart';
import 'package:clean_movies/common/route_list.dart';
import 'package:clean_movies/common/routes.dart';
import 'package:clean_movies/common/screenutil/screen_util.dart';
import 'package:clean_movies/di/get_it.dart';
import 'package:clean_movies/domain/app_localizations.dart';
import 'package:clean_movies/presentation/blocs/language/language_cubit.dart';
import 'package:clean_movies/presentation/blocs/loading_cubit/loading_cubit.dart';
import 'package:clean_movies/presentation/themes/app_color.dart';
import 'package:clean_movies/presentation/themes/theme_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:wiredash/wiredash.dart';

import 'blocs/login/login_bloc.dart';
import 'blocs/theme/theme_cubit.dart';

class MovieApp extends StatefulWidget {
  const MovieApp({Key? key}) : super(key: key);

  @override
  State<MovieApp> createState() => _MovieAppState();
}

class _MovieAppState extends State<MovieApp> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  LanguageCubit? _languageCubit;
  LoginBloc? _loginBloc;
  LoadingCubit? _loadingCubit;
  ThemeCubit? _themeCubit;

  @override
  void initState() {
    super.initState();
    _languageCubit = getItInstance<LanguageCubit>();
    _languageCubit?.loadPreferredLanguage();
    _loginBloc = getItInstance<LoginBloc>();
    _loadingCubit = getItInstance<LoadingCubit>();
    _themeCubit = getItInstance<ThemeCubit>();
  }

  @override
  void dispose() {
    _languageCubit?.close();
    _loginBloc?.close();
    _loadingCubit?.close();
    _themeCubit?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(width: 414, height: 896);
    return MultiBlocProvider(
      providers: [
        BlocProvider<LanguageCubit>.value(
          value: _languageCubit!,
        ),
        BlocProvider<LoginBloc>.value(
          value: _loginBloc!,
        ),
        BlocProvider<LoadingCubit>.value(
          value: _loadingCubit!,
        ),
        BlocProvider<ThemeCubit>.value(
          value: _themeCubit!,
        ),
      ],
      child: BlocBuilder<ThemeCubit, Themes>(
        builder: (context, theme) {
          print(theme);
          return BlocBuilder<LanguageCubit, Locale>(
            builder: (context, locale) {
              return WiredashApp(
                navigatorKey: _navigatorKey,
                languageCode: locale.languageCode,
                child: MaterialApp(
                  debugShowCheckedModeBanner: false,
                  supportedLocales:
                      Languages.languages.map((e) => Locale(e.code)).toList(),
                  locale: locale,
                  localizationsDelegates: const [
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    AppLocalizations.delegate,
                  ],
                  builder: (context, child) {
                    return child!;
                  },
                  onGenerateRoute: (RouteSettings settings) {
                    final routes = Routes.getRoutes(settings);
                    WidgetBuilder builder = routes[settings.name]!;
                    return FadePageRouteBuilder(
                      builder: builder,
                      settings: settings,
                    );
                  },
                  initialRoute: RouteList.initial,
                  title: 'Movie App',
                  navigatorKey: _navigatorKey,
                  theme: ThemeData(
                    primaryColor:
                        theme == Themes.dark ? AppColor.vulcan : Colors.white,
                    scaffoldBackgroundColor:
                        theme == Themes.dark ? AppColor.vulcan : Colors.white,
                    cardTheme: CardTheme(
                      color:
                          theme == Themes.dark ? Colors.white : AppColor.vulcan,
                    ),
                    visualDensity: VisualDensity.adaptivePlatformDensity,
                    textTheme: theme == Themes.dark
                        ? ThemeText.getTextTheme()
                        : ThemeText.getLightTextTheme(),
                    appBarTheme: const AppBarTheme(elevation: 0),
                    inputDecorationTheme: InputDecorationTheme(
                      hintStyle: Theme.of(context).textTheme.greySubtitle1,
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: theme == Themes.dark
                              ? Colors.white
                              : AppColor.vulcan,
                        ),
                      ),
                      enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                    ),
                    colorScheme: ColorScheme.fromSwatch().copyWith(
                      secondary:
                          theme == Themes.dark ? AppColor.vulcan : Colors.white,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class WiredashApp extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
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

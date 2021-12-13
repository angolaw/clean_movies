import 'package:bloc/bloc.dart';
import 'package:clean_movies/domain/usecases/get_preferred_theme.dart';
import 'package:clean_movies/domain/usecases/no_params.dart';
import 'package:clean_movies/domain/usecases/update_preferred_theme.dart';

enum Themes {
  light,
  dark,
}

class ThemeCubit extends Cubit<Themes> {
  final GetPreferredTheme getPreferredTheme;
  final UpdatePreferredTheme updatePreferredTheme;
  ThemeCubit(
      {required this.getPreferredTheme, required this.updatePreferredTheme})
      : super(Themes.dark);

  Future<void> toggleTheme() async {
    await updatePreferredTheme(state == Themes.dark ? 'light' : 'dark');
    loadPreferredTheme();
  }

  void loadPreferredTheme() async {
    final response = await getPreferredTheme(NoParams());
    emit(response.fold(
      (failure) => Themes.dark,
      (theme) => theme == 'dark' ? Themes.dark : Themes.light,
    ));
  }
}

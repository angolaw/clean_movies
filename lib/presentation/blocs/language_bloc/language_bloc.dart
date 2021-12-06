import 'package:bloc/bloc.dart';
import 'package:clean_movies/common/constants/languages.dart';
import 'package:clean_movies/domain/entities/app_error.dart';
import 'package:clean_movies/domain/entities/language_entity.dart';
import 'package:clean_movies/domain/usecases/get_preferred_language.dart';
import 'package:clean_movies/domain/usecases/no_params.dart';
import 'package:clean_movies/domain/usecases/update_language.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  final GetPreferredLanguage getPreferredLanguage;
  final UpdateLanguage updateLanguage;
  LanguageBloc(
      {required this.getPreferredLanguage, required this.updateLanguage})
      //* language default como ENGLISH
      : super(LanguageLoaded(locale: Locale(Languages.languages[0].code))) {
    on<LanguageEvent>((event, emit) async {
      if (event is ToggleLanguageEvent) {
        await updateLanguage(event.language.code);
        emit(LanguageLoaded(locale: Locale(event.language.code)));
      } else if (event is LoadPreferredLanguageEvent) {
        final Either<AppError, String> eitherResponse =
            await getPreferredLanguage(NoParams());
        eitherResponse.fold(
          (l) => emit(LanguageError()),
          (r) => emit(LanguageLoaded(locale: Locale(r))),
        );
      }
    });
  }
}

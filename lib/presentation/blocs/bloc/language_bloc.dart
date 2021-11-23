import 'package:bloc/bloc.dart';
import 'package:clean_movies/common/constants/languages.dart';
import 'package:clean_movies/domain/entities/language_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc()
      //* language default como ENGLISH
      : super(LanguageLoaded(locale: Locale(Languages.languages[0].code))) {
    on<LanguageEvent>((event, emit) {
      if (event is ToggleLanguageEvent) {
        emit(LanguageLoaded(locale: Locale(event.language.code)));
      }
    });
  }
}

import 'package:clean_movies/common/constants/size_constants.dart';
import 'package:clean_movies/common/extensions/size_extension.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeText {
  const ThemeText._();

  static TextTheme get _poppinsTheme => GoogleFonts.poppinsTextTheme();

  static TextStyle get _whiteHeadline6 => _poppinsTheme.headline6!.copyWith(
        fontSize: Sizes.dimen_20.sp.toDouble(),
        color: Colors.white,
      );
  static getTextTheme() => TextTheme(headline6: _whiteHeadline6);
}

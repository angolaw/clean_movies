import 'package:clean_movies/presentation/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

extension TextThemeExtension on TextTheme {
  TextStyle get royalBlueSubtitle1 => subtitle1!
      .copyWith(color: AppColor.royalBlue, fontWeight: FontWeight.w600);
}

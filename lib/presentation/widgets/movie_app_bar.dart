import 'package:clean_movies/common/constants/size_constants.dart';
import 'package:clean_movies/common/extensions/size_extension.dart';
import 'package:clean_movies/common/screenutil/screen_util.dart';
import 'package:flutter/material.dart';

class MovieAppBar extends StatelessWidget {
  const MovieAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
      top: ScreenUtil.statusBarHeight + Sizes.dimen_4.h,
      left: Sizes.dimen_16.w.toDouble(),
      right: Sizes.dimen_16.w.toDouble(),
    ));
  }
}

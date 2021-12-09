import 'package:clean_movies/presentation/blocs/theme/theme_cubit.dart';
import 'package:clean_movies/presentation/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:clean_movies/common/extensions/size_extension.dart';
import 'package:provider/src/provider.dart';

class Logo extends StatelessWidget {
  final double height;
  const Logo({required this.height, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/pngs/logo.png',
        key: const ValueKey('logo_image_key'),
        color: context.read<ThemeCubit>().state == Themes.dark
            ? Colors.white
            : AppColor.vulcan,
        height: height.h.toDouble());
  }
}

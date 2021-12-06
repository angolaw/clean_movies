import 'package:clean_movies/common/constants/size_constants.dart';
import 'package:clean_movies/presentation/journeys/loading/loading_circle.dart';
import 'package:clean_movies/presentation/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:clean_movies/common/extensions/size_extension.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: AppColor.vulcan.withOpacity(0.8),
        ),
        child:
            Center(child: LoadingCircle(size: Sizes.dimen_200.w.toDouble())));
  }
}

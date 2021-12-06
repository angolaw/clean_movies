import 'package:clean_movies/common/constants/size_constants.dart';
import 'package:clean_movies/presentation/blocs/loading/loading_bloc.dart';
import 'package:clean_movies/presentation/journeys/loading/loading_circle.dart';
import 'package:clean_movies/presentation/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:clean_movies/common/extensions/size_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoadingScreen extends StatelessWidget {
  final Widget screen;
  const LoadingScreen({Key? key, required this.screen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoadingBloc, LoadingState>(
      builder: (context, state) {
        return Stack(
          fit: StackFit.expand,
          children: [
            screen,
            if (state is LoadingStarted)
              Container(
                  decoration: BoxDecoration(
                    color: AppColor.vulcan.withOpacity(0.8),
                  ),
                  child: Center(
                      child:
                          LoadingCircle(size: Sizes.dimen_200.w.toDouble()))),
          ],
        );
      },
    );
  }
}

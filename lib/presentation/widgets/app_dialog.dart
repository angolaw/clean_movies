import 'package:clean_movies/common/constants/size_constants.dart';
import 'package:clean_movies/common/extensions/size_extension.dart';
import 'package:clean_movies/presentation/themes/app_color.dart';
import 'package:flutter/material.dart';

class AppDialog extends StatelessWidget {
  final String title, description, buttonText;
  final Widget? image;

  const AppDialog(
      {Key? key,
      required this.title,
      required this.description,
      required this.buttonText,
      this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColor.vulcan,
      elevation: Sizes.dimen_32.toDouble(),
      insetPadding: EdgeInsets.all(Sizes.dimen_32.w.toDouble()),
      shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.all(Radius.circular(Sizes.dimen_8.w.toDouble()))),
    );
  }
}

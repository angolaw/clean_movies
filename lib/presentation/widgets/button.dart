import 'package:clean_movies/common/constants/size_constants.dart';
import 'package:clean_movies/common/extensions/size_extension.dart';
import 'package:clean_movies/common/extensions/string_extensions.dart';
import 'package:clean_movies/presentation/themes/app_color.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  //1
  final String text;

  //2
  final VoidCallback onPressed;

  const Button({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //3
    return Container(
      decoration: BoxDecoration(
        //2
        gradient: const LinearGradient(
          colors: [
            AppColor.royalBlue,
            AppColor.violet,
          ],
        ),
        //3
        borderRadius: BorderRadius.all(
          Radius.circular(Sizes.dimen_20.w.toDouble()),
        ),
      ),
      //4
      padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_16.w.toDouble()),
      //5
      margin: EdgeInsets.symmetric(vertical: Sizes.dimen_10.h.toDouble()),
      //6
      height: Sizes.dimen_16.h.toDouble(),

      child: TextButton(
        onPressed: onPressed,
        child: Text(
          //4
          text.t(context),
          //5
          style: Theme.of(context).textTheme.button,
        ),
      ),
    );
  }
}

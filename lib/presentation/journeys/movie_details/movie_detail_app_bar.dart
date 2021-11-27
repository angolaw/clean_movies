import 'package:clean_movies/common/constants/size_constants.dart';
import 'package:clean_movies/common/extensions/size_extension.dart';
import 'package:flutter/material.dart';

class MovieDetailAppBar extends StatelessWidget {
  const MovieDetailAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      //4
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //2
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: Sizes.dimen_12.h.toDouble(),
          ),
        ),

        //3
        Icon(
          Icons.favorite_border,
          color: Colors.white,
          size: Sizes.dimen_12.h.toDouble(),
        ),
      ],
    );
  }
}

import 'package:clean_movies/common/constants/size_constants.dart';
import 'package:clean_movies/common/extensions/size_extension.dart';
import 'package:clean_movies/presentation/themes/app_color.dart';
import 'package:flutter/cupertino.dart';

class Separator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //1
    return Container(
      height: Sizes.dimen_1.h.toDouble(),
      width: Sizes.dimen_80.w.toDouble(),
      //2
      padding: EdgeInsets.only(
        top: Sizes.dimen_2.h.toDouble(),
        bottom: Sizes.dimen_6.h.toDouble(),
      ),
      //3
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.all(Radius.circular(Sizes.dimen_1.h.toDouble())),
        gradient: const LinearGradient(
          colors: [
            AppColor.vulcan,
            AppColor.royalBlue,
          ],
        ),
      ),
    );
  }
}

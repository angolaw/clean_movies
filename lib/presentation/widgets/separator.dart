import 'package:clean_movies/common/constants/size_constants.dart';
import 'package:clean_movies/common/extensions/size_extension.dart';
import 'package:clean_movies/presentation/themes/app_color.dart';
import 'package:flutter/cupertino.dart';

class Separator extends StatelessWidget {
  const Separator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //1
    return Container(
      height: Sizes.dimen_1.h,
      width: Sizes.dimen_80.w,
      //2
      padding: EdgeInsets.only(
        top: Sizes.dimen_2.h,
        bottom: Sizes.dimen_6.h,
      ),
      //3
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(Sizes.dimen_1.h)),
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

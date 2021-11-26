import 'package:clean_movies/common/constants/size_constants.dart';
import 'package:clean_movies/common/constants/translation_constants.dart';
import 'package:clean_movies/common/extensions/size_extension.dart';
import 'package:clean_movies/common/extensions/string_extensions.dart';
import 'package:clean_movies/domain/entities/app_error.dart';
import 'package:flutter/material.dart';
import 'package:wiredash/wiredash.dart';

import 'button.dart';

class AppErrorWidget extends StatelessWidget {
  final AppErrorType errorType;
  final VoidCallback onPressed;
  const AppErrorWidget(
      {Key? key, required this.errorType, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_32.w.toDouble()),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            errorType == AppErrorType.api
                ? TranslationsConstants.somethingWentWrong.t(context)
                : TranslationsConstants.checkNetwork.t(context),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          ButtonBar(
            children: [
              Button(
                onPressed: onPressed,
                text: TranslationsConstants.retry,
              ),
              Button(
                onPressed: () => Wiredash.of(context)?.show(),
                text: TranslationsConstants.feedback,
              ),
            ],
          )
        ],
      ),
    );
  }
}

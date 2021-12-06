import 'package:clean_movies/common/constants/size_constants.dart';
import 'package:clean_movies/common/constants/translation_constants.dart';
import 'package:clean_movies/common/extensions/size_extension.dart';
import 'package:flutter/material.dart';

import 'label_field_widget.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController? _userNameController, _passwordController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _userNameController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _passwordController?.dispose();
    _userNameController?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
     return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Sizes.dimen_32.w.toDouble(),
          vertical: Sizes.dimen_24.h.toDouble(),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //5
            Padding(
              padding: EdgeInsets.only(bottom: Sizes.dimen_8.h.toDouble()),
              child: Text(
                TranslationsConstants.loginToMovieApp.t(context),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            //6
            LabelFieldWidget(
              label: TranslationsConstants.username.t(context),
              hintText: TranslationsConstants.enterTMDbUsername.t(context),,
              controller: _userNameController!,
            ),
            //7
            LabelFieldWidget(
              label: TranslationsConstants.password.t(context),,
              hintText: TranslationsConstants.enterPassword.t(context),,
              controller: _passwordController!,
              isPasswordField: true,
            ),
          ],
        ),
      ),
    );
  }
}

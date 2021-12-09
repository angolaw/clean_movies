import 'package:clean_movies/common/constants/size_constants.dart';
import 'package:clean_movies/common/constants/translation_constants.dart';
import 'package:clean_movies/common/extensions/size_extension.dart';
import 'package:clean_movies/common/extensions/string_extensions.dart';
import 'package:clean_movies/common/route_list.dart';
import 'package:clean_movies/presentation/blocs/login/login_bloc.dart';
import 'package:clean_movies/presentation/themes/theme_text.dart';
import 'package:clean_movies/presentation/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'label_field_widget.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController? _userNameController, _passwordController;
  bool enableSignIn = false;
  @override
  void initState() {
    super.initState();
    _userNameController = TextEditingController();
    _passwordController = TextEditingController();

    _userNameController!.addListener(() {
      setState(() {
        enableSignIn = _userNameController!.text.isNotEmpty &&
            _passwordController!.text.isNotEmpty;
      });
    });
    _passwordController!.addListener(() {
      setState(() {
        enableSignIn = _userNameController!.text.isNotEmpty &&
            _passwordController!.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
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
              hintText: TranslationsConstants.enterTMDbUsername.t(context),
              controller: _userNameController!,
            ),
            //7
            LabelFieldWidget(
              label: TranslationsConstants.password.t(context),
              hintText: TranslationsConstants.enterPassword.t(context),
              controller: _passwordController!,
              isPasswordField: true,
            ),
            BlocConsumer<LoginBloc, LoginState>(
              buildWhen: (previous, current) => current is LoginError,
              builder: (context, state) {
                if (state is LoginError) {
                  Text(
                    state.message.t(context),
                    style: Theme.of(context).textTheme.orangeSubtitle1,
                  );
                }
                return const SizedBox.shrink();
              },
              listenWhen: (previous, current) => current is LoginSuccess,
              listener: (context, state) {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(RouteList.home, (route) => false);
              },
            ),
            Button(
              onPressed: enableSignIn
                  ? () {
                      BlocProvider.of<LoginBloc>(context).add(
                          LoginInitiateEvent(
                              username: _userNameController!.text,
                              password: _passwordController!.text));
                    }
                  : null,
              text: TranslationsConstants.signIn,
              isEnabled: enableSignIn,
            ),
            Button(
              onPressed: () =>
                  BlocProvider.of<LoginBloc>(context).add(GuestLoginEvent()),
              text: TranslationsConstants.guestSignIn,
            )
          ],
        ),
      ),
    );
  }
}

import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:netflix/common/helper/display.dart';
import 'package:netflix/common/helper/navigation/app_navigation.dart';
import 'package:netflix/core/config/theme/app_color.dart';
import 'package:netflix/data/models/signinreq.dart';
import 'package:netflix/domain/usecases/signin.dart';
import 'package:netflix/home/pages/home.dart';
import 'package:netflix/presentation/auth/pages/signup.dart';
import 'package:netflix/service_locator.dart';
import 'package:reactive_button/reactive_button.dart';

class Signin extends StatelessWidget {
  Signin({super.key});
  TextEditingController _emailCon = TextEditingController();
  TextEditingController _passwordCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          minimum: const EdgeInsets.only(top: 100, right: 16, left: 16),
          child: Column(
            children: [
              _signinText(),
              const SizedBox(
                height: 30,
              ),
              _emailField(),
              const SizedBox(
                height: 30,
              ),
              _passwordField(),
              const SizedBox(
                height: 30,
              ),
              _signinButton(context),
              const SizedBox(
                height: 30,
              ),
              _signUpText(context),
            ],
          )),
    );
  }

  Widget _signinText() {
    return const Text(
      'Sign In ',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
    );
  }

  Widget _emailField() {
    return TextField(
      controller: _emailCon,
      decoration: const InputDecoration(hintText: 'Email'),
    );
  }

  Widget _passwordField() {
    return TextField(
      controller: _passwordCon,
      decoration: const InputDecoration(hintText: 'Password'),
    );
  }

  Widget _signinButton(BuildContext context) {
    return ReactiveButton(
      title: 'Sign In',
      activeColor: AppColors.primary,
      onPressed: () async => s1<SigninUseCase>().call(
          params:
              Signinreq(email: _emailCon.text, password: _passwordCon.text)),
      onSuccess: () {
        AppNavigator.pushAndRemove(context, const Home());
      },
      onFailure: (error) {
        DisplayMessage.errorMessage(error, context);
      },
    );
  }

  Widget _signUpText(BuildContext context) {
    return Text.rich(TextSpan(children: [
      TextSpan(text: "Don't You Have An Account!!"),
      TextSpan(
          style: TextStyle(color: Colors.blue),
          text: "Sign Up",
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              AppNavigator.push(context, SignUp());
            })
    ]));
  }
}

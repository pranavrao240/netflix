import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:netflix/common/helper/display.dart';
import 'package:netflix/common/helper/navigation/app_navigation.dart';
import 'package:netflix/core/config/theme/app_color.dart';
import 'package:netflix/data/models/signupreq.dart';
import 'package:netflix/domain/usecases/signup.dart';
import 'package:netflix/presentation/auth/pages/signin.dart';
import 'package:netflix/service_locator.dart';
import 'package:reactive_button/reactive_button.dart';

class SignUp extends StatefulWidget {
  SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _emailCon = TextEditingController();

  TextEditingController _passwordCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          minimum: const EdgeInsets.only(top: 100, right: 16, left: 16),
          child: Column(
            children: [
              _signupText(),
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
              _signupButton(context),
              const SizedBox(
                height: 30,
              ),
              _signinText(context),
            ],
          )),
    );
  }

  Widget _signupText() {
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

  Widget _signupButton(BuildContext context) {
    return ReactiveButton(
      title: 'Sign Up',
      activeColor: AppColors.primary,
      onPressed: () async {
        return await s1<SignupUseCase>().call(
            params:
                Signupreq(email: _emailCon.text, password: _passwordCon.text));
      },
      onSuccess: () {},
      onFailure: (error) {
        DisplayMessage.errorMessage(error, context);
      },
    );
  }

  Widget _signinText(BuildContext context) {
    return Text.rich(TextSpan(children: [
      TextSpan(text: "Do You Have An Account!!"),
      TextSpan(
          style: TextStyle(color: Colors.blue),
          text: "Sign Up",
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              AppNavigator.push(context, Signin());
            })
    ]));
  }
}

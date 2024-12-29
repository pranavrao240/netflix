import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/asset/app_images.dart';
import 'package:netflix/common/helper/navigation/app_navigation.dart';
import 'package:netflix/home/pages/home.dart';
import 'package:netflix/presentation/auth/pages/signin.dart';
import 'package:netflix/presentation/splash/bloc/splash_cubit.dart';
import 'package:netflix/presentation/splash/bloc/splash_state.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashCubit, SplashState>(
        listener: (BuildContext context, SplashState state) {
          if (state is UnAuthenticated) {
            AppNavigator.pushReplacement(context, Signin());
          }
          if (state is Authenticated) {
            AppNavigator.pushReplacement(context, const Home());
          }
        },
        child: Stack(children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppImages.splashBackground))),
          ),
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.center,
                    end: Alignment.bottomCenter,
                    colors: [
                  Color(0xff1A1B20).withOpacity(0),
                  Color(0xff1A1B20)
                ])),
          )
        ]),
      ),
    );
  }
}

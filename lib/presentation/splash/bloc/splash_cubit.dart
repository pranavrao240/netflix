import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/domain/usecases/loggedIn.dart';
import 'package:netflix/presentation/splash/bloc/splash_state.dart';
import 'package:netflix/service_locator.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(DisplaySplash());
  void appstarted() async {
    await Future.delayed(const Duration(seconds: 2));
    var loggedIn = await s1<IsLoggedInUseCase>().call();
    if (loggedIn) {
      emit(Authenticated());
    } else {
      emit(UnAuthenticated());
    }
  }
}

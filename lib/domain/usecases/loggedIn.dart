import 'package:dartz/dartz.dart';
import 'package:netflix/core/usecases/usecase.dart';
import 'package:netflix/data/models/signinreq.dart';
import 'package:netflix/data/sources/auth_apiService.dart';
import 'package:netflix/domain/repositories/authentication.dart';
import 'package:netflix/service_locator.dart';

class IsLoggedInUseCase extends Usecase<bool, dynamic> {
  @override
  Future<bool> call({params}) async {
    return await s1<Authpository>().isLoggedIn();
  }
}

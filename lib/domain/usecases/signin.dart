import 'package:dartz/dartz.dart';
import 'package:netflix/core/usecases/usecase.dart';
import 'package:netflix/data/models/signinreq.dart';
import 'package:netflix/data/sources/auth_apiService.dart';
import 'package:netflix/service_locator.dart';

class SigninUseCase extends Usecase<Either, Signinreq> {
  @override
  Future<Either> call({Signinreq? params}) async {
    return await s1<AuthApiservice>().signin(params!);
  }
}

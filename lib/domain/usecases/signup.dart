import 'package:dartz/dartz.dart';
import 'package:netflix/core/usecases/usecase.dart';
import 'package:netflix/data/models/signupreq.dart';
import 'package:netflix/data/sources/auth_apiService.dart';
import 'package:netflix/service_locator.dart';

class SignupUseCase extends Usecase<Either, Signupreq> {
  @override
  Future<Either> call({Signupreq? params}) async {
    return await s1<AuthApiservice>().signup(params!);
  }
}

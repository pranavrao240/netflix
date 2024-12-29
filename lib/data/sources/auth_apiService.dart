import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:netflix/core/constants/api_url.dart';
import 'package:netflix/core/network/dio_client.dart';
import 'package:netflix/data/models/signinreq.dart';
import 'package:netflix/data/models/signupreq.dart';
import 'package:netflix/service_locator.dart';

abstract class AuthApiservice {
  Future<Either> signup(Signupreq params);
  Future<Either> signin(Signinreq params);
}

class AuthApiServiceImpl extends AuthApiservice {
  @override
  Future<Either> signup(Signupreq params) async {
    try {
      var response =
          await s1<DioClient>().post(ApiUrl.signup, data: params.toMap());
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> signin(Signinreq params) async {
    try {
      var response =
          await s1<DioClient>().post(ApiUrl.signin, data: params.toMap());
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
}

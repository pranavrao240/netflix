import 'package:dartz/dartz.dart';
import 'package:netflix/data/models/signinreq.dart';
import 'package:netflix/data/models/signupreq.dart';
import 'package:netflix/data/sources/auth_apiService.dart';
import 'package:netflix/domain/repositories/authentication.dart';
import 'package:netflix/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepositoryImpl extends Authpository {
  @override
  Future<Either> signup(Signupreq params) async {
    var data = await s1<AuthApiservice>().signup(params);
    return data.fold((error) {
      return Left(error);
    }, (data) async {
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString('token', data['user']['token']);
      return Right(data);
    });
  }

  @override
  Future<Either> signin(Signinreq params) async {
    var data = await s1<AuthApiservice>().signin(params);
    return data.fold((error) {
      return Left(error);
    }, (data) async {
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString('token', data['user']['token']);
      return Right(data);
    });
  }

  @override
  Future<bool> isLoggedIn() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    if (token == null) {
      return false;
    } else {
      return true;
    }
  }
}

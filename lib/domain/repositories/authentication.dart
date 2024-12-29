import 'package:dartz/dartz.dart';
import 'package:netflix/data/models/signinreq.dart';
import 'package:netflix/data/models/signupreq.dart';

// Either has two sides:
//   1.Left side: containes data
//   2.Right Side: containes errs
// Used to hadle Errors
abstract class Authpository {
  Future<Either> signup(Signupreq params);
  Future<Either> signin(Signinreq params);
  Future<bool> isLoggedIn();
}

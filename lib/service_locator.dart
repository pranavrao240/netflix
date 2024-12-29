import 'package:get_it/get_it.dart';
import 'package:netflix/core/network/dio_client.dart';
import 'package:netflix/data/models/signinreq.dart';
import 'package:netflix/data/movies/repositories/movie.dart';
import 'package:netflix/data/movies/sources/movie.dart';
import 'package:netflix/data/repositories/auth.dart';
import 'package:netflix/data/sources/auth_apiService.dart';
import 'package:netflix/domain/movies/repositories/movie.dart';
import 'package:netflix/domain/movies/usecases/get_trending_movies.dart';
import 'package:netflix/domain/repositories/authentication.dart';
import 'package:netflix/domain/usecases/loggedIn.dart';
import 'package:netflix/domain/usecases/signin.dart';
import 'package:netflix/domain/usecases/signup.dart';

final s1 = GetIt.instance;

void setupServiceLocator() {
  s1.registerSingleton<DioClient>(DioClient());

  // Service

  s1.registerSingleton<AuthApiservice>(AuthApiServiceImpl());
  s1.registerSingleton<MovieService>(MovieApiServiceImpl());

  // Repositories
  s1.registerSingleton<Authpository>(AuthRepositoryImpl());
  s1.registerSingleton<MovieRepository>(MovieRepositoriesImpl());
  // Usecase
  s1.registerSingleton<SignupUseCase>(SignupUseCase());
  s1.registerSingleton<SigninUseCase>(SigninUseCase());

  s1.registerSingleton<IsLoggedInUseCase>(IsLoggedInUseCase());
  s1.registerSingleton<GetTrendingMoviesUseCase>(GetTrendingMoviesUseCase());
}

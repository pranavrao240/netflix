import 'package:dartz/dartz.dart';
import 'package:netflix/core/usecases/usecase.dart';
import 'package:netflix/data/models/signinreq.dart';
import 'package:netflix/data/sources/auth_apiService.dart';
import 'package:netflix/domain/movies/repositories/movie.dart';
import 'package:netflix/service_locator.dart';

class GetTrendingMoviesUseCase extends Usecase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await s1<MovieRepository>().getTrendingMovies();
  }
}

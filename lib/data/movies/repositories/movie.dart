import 'package:dartz/dartz.dart';
import 'package:netflix/common/helper/mapper/movie_mapper.dart';
import 'package:netflix/data/movies/models/movie.dart';
import 'package:netflix/data/movies/sources/movie.dart';
import 'package:netflix/domain/movies/repositories/movie.dart';
import 'package:netflix/service_locator.dart';

class MovieRepositoriesImpl extends MovieRepository {
  @override
  Future<Either> getTrendingMovies() async {
    var returnData = await s1<MovieService>().getTrendingMovies();
    return returnData.fold((error) {
      return Left(error);
    }, (data) {
      var movies = List.from(data['content'])
          .map((item) => MovieMapper.toEntity(MovieModel.fromJson(item)));
      return Right(movies);
    });
  }
}

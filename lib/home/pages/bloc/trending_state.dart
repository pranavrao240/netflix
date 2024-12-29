import 'package:netflix/domain/movies/entities/movie.dart';

abstract class TrendingState {}

class TrendingMoviesLoading extends TrendingState {}

class TrendingMoviesLoaded extends TrendingState {
  final List<MovieEntity> movies;
  TrendingMoviesLoaded({required this.movies});
}

class FailureLoadTrendingMovies extends TrendingState {
  final String errMsg;
  FailureLoadTrendingMovies({required this.errMsg});
}

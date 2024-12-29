import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/domain/movies/usecases/get_trending_movies.dart';
import 'package:netflix/home/pages/bloc/trending_state.dart';
import 'package:netflix/home/widget/trending.dart';
import 'package:netflix/service_locator.dart';

class TrendingCubit extends Cubit<TrendingState> {
  TrendingCubit() : super(TrendingMoviesLoading());
  void getTrendingMovies() async {
    var returnData = await s1<GetTrendingMoviesUseCase>().call();
    return returnData.fold((error) {
      FailureLoadTrendingMovies(errMsg: error);
    }, (data) {
      TrendingMoviesLoaded(movies: data);
    });
  }
}

import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/asset/app_images.dart';
import 'package:netflix/home/pages/bloc/trending_cubit.dart';
import 'package:netflix/home/pages/bloc/trending_state.dart';

class TrendingMovies extends StatelessWidget {
  const TrendingMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => TrendingCubit()..getTrendingMovies(),
        child: BlocBuilder<TrendingCubit, TrendingState>(
          builder: (context, state) {
            if (state is TrendingMoviesLoading) {
              return const Center(
                  child: Padding(
                padding: EdgeInsets.only(top: 30),
                child: CircularProgressIndicator(
                  backgroundColor: Colors.red,
                ),
              ));
            }
            if (state is TrendingMoviesLoaded) {
              return FanCarouselImageSlider(
                imagesLink: state.movies
                    .map((item) =>
                        AppImages.movieImageBasePath +
                        item.posterPath.toString())
                    .toList(),
                isAssets: false,
                autoPlay: false,
                sliderHeight: 400,
                showIndicator: true,
              );
            }
            if (state is FailureLoadTrendingMovies) {
              return Center(child: Text(state.errMsg));
            }
            return Container();
          },
        ));
  }
}

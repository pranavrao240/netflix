import 'package:flutter/material.dart';
import 'package:netflix/home/widget/trending.dart';
import 'package:svg_flutter/svg.dart';
import 'package:netflix/core/config/asset/app_vectors.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: EdgeInsets.only(left: 10),
            child: SvgPicture.asset(AppVectors.logo),
          ),
        ),
        body: const SingleChildScrollView(child: TrendingMovies()));
  }
}

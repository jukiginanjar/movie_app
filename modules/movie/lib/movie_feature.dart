import 'package:data/models/movie_model.dart';
import 'package:data/repositories/movie_repository.dart';
import 'package:data/repositories/review_repository.dart';
import 'package:feature_manager/feature.dart';
import 'package:feature_manager/feature_tab.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie/pages/detail/movie_detail_controller.dart';
import 'package:movie/pages/detail/movie_detail_page.dart';
import 'package:movie/pages/movie/movie_controller.dart';
import 'package:movie/pages/movie/movie_page.dart';
import 'package:movie/states/now_playing_state.dart';
import 'package:movie/states/movie_reviews_state.dart';
import 'package:movie/states/popular_movie_state.dart';
import 'package:movie/states/upcoming_movie_state.dart';

class MovieFeature implements Feature {
  @override
  List<GetPage> get routes => [
        GetPage(
          name: '/movie_detail',
          page: () => const MovieDetailPage(),
          binding: BindingsBuilder(() {
            MovieModel model = Get.arguments;
            Get.lazyPut(
              () => MovieDetailController(
                  model, MovieReviewsState(ReviewRepositoryImpl())),
            );
          }),
        )
      ];

  @override
  FeatureTab get tab => MovieFeatureTab();
}

class MovieFeatureTab implements FeatureTab {
  @override
  IconData get icon => Icons.movie_rounded;

  @override
  String get title => 'Movie';

  @override
  FeatureTabPage get page => MovieFeatureTabPage();
}

class MovieFeatureTabPage implements FeatureTabPage {
  @override
  void dependencies() {
    Get.lazyPut(() => MovieController(
          NowPlayingState(MovieRepositoryImpl()),
          UpcomingMovieState(MovieRepositoryImpl()),
          PopularMovieState(MovieRepositoryImpl()),
        ));
  }

  @override
  Widget get widget => const MoviePage();
}

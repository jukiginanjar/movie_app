import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie/pages/detail/movie_detail_controller.dart';
import 'package:movie/pages/detail/movie_detail_page.dart';
import 'package:movie/pages/movie/movie_controller.dart';
import 'package:movie/pages/movie/movie_page.dart';
import 'package:platform/feature.dart';
import 'package:platform/feature_tab.dart';

class MovieFeature implements Feature {
  @override
  List<GetPage> get routes => [
        GetPage(
          name: '/movie_detail',
          page: () => const MovieDetailPage(),
          binding: BindingsBuilder(() {
            Get.lazyPut(() => MovieDetailController());
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
    Get.lazyPut(() => MovieController());
  }

  @override
  Widget get widget => const MoviePage();
}

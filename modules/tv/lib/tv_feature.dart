import 'package:data/models/tv_model.dart';
import 'package:data/repositories/review_repository.dart';
import 'package:data/repositories/tv_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:feature_manager/feature.dart';
import 'package:feature_manager/feature_tab.dart';
import 'package:tv/pages/detail/tv_detail_controller.dart';
import 'package:tv/pages/detail/tv_detail_page.dart';
import 'package:tv/pages/tv/tv_controller.dart';
import 'package:tv/pages/tv/tv_page.dart';
import 'package:tv/states/ota_tv_state.dart';
import 'package:tv/states/popular_tv_state.dart';
import 'package:tv/states/tv_reviews_state.dart';

class TvFeature implements Feature {
  @override
  List<GetPage> get routes => [
        GetPage(
          name: '/tv_detail',
          page: () => const TvDetailPage(),
          binding: BindingsBuilder(() {
            TvModel model = Get.arguments;
            TvReviewsState reviewState = TvReviewsState(ReviewRepositoryImpl());
            Get.lazyPut(() => TvDetailController(model, reviewState));
          }),
        )
      ];

  @override
  FeatureTab get tab => TvFeatureTab();
}

class TvFeatureTab implements FeatureTab {
  @override
  IconData get icon => Icons.tv_rounded;

  @override
  String get title => 'TV';

  @override
  FeatureTabPage get page => TvFeatureTabPage();
}

class TvFeatureTabPage implements FeatureTabPage {
  @override
  void dependencies() {
    Get.lazyPut(() => OtaTvState(TvRepositoryImpl()));
    Get.lazyPut(() => PopularTvState(TvRepositoryImpl()));
    Get.lazyPut(() => TvController());
  }

  @override
  Widget get widget => const TvPage();
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:platform/feature.dart';
import 'package:platform/feature_tab.dart';
import 'package:tv/pages/detail/tv_detail_controller.dart';
import 'package:tv/pages/detail/tv_detail_page.dart';
import 'package:tv/pages/tv/tv_controller.dart';
import 'package:tv/pages/tv/tv_page.dart';

class TvFeature implements Feature {
  @override
  List<GetPage> get routes => [
        GetPage(
          name: '/tv_detail',
          page: () => const TvDetailPage(),
          binding: BindingsBuilder(() {
            Get.lazyPut(() => TvDetailController());
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
    Get.lazyPut(() => TvController());
  }

  @override
  Widget get widget => const TvPage();
}

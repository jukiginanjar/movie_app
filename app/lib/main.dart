import 'package:account/account_feature.dart';
import 'package:app/pages/main_controller.dart';
import 'package:app/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie/movie_feature.dart';
import 'package:feature_manager/feature_manager.dart';
import 'package:tv/tv_feature.dart';

void main() {
  FeatureManager.initialize(() => [
        MovieFeature(),
        TvFeature(),
        AccountFeature(),
      ]);

  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  static const _main = '/main';

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Movie App',
      initialRoute: _main,
      theme: ThemeData.dark(),
      getPages: [_mainRoute] + FeatureManager.routes,
    );
  }

  GetPage<dynamic> get _mainRoute {
    return GetPage(
      name: _main,
      page: () => const MainPage(),
      binding: BindingsBuilder(() {
        _registerFeatureTabDependencies();
        Get.lazyPut(() => MainController());
      }),
    );
  }

  void _registerFeatureTabDependencies() {
    for (var element in FeatureManager.featureTabs) {
      element.page.dependencies();
    }
  }
}

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
    final main = GetPage(
      name: _main,
      page: () => const MainPage(),
      binding: BindingsBuilder(() {
        for (var element in FeatureManager.featureTabs) {
          element.page.dependencies();
        }
        Get.lazyPut(() => MainController());
      }),
    );

    return GetMaterialApp(
      title: 'Movie App',
      initialRoute: _main,
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.amber),
      ),
      getPages: [main] + FeatureManager.routes,
    );
  }
}

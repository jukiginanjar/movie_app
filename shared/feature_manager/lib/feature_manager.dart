import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:feature_manager/feature.dart';
import 'package:feature_manager/feature_tab.dart';

class FeatureManager {
  FeatureManager._privateConstructor();

  static final FeatureManager _instance = FeatureManager._privateConstructor();

  List<Feature> _features = [];

  static void initialize(List<Feature> Function() buildFeatures) {
    _instance._features = buildFeatures();
  }

  static List<FeatureTab> get featureTabs {
    return _instance._features.map((e) => e.tab).toList();
  }

  static List<Widget> get tabPages {
    return featureTabs.map((e) => e.page.widget).toList();
  }

  static List<GetPage> get routes {
    return _instance._features
        .fold([], (previousValue, element) => previousValue + element.routes);
  }
}

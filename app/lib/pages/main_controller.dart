import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:platform/feature_manager.dart';

class MainController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late final TabController tabController;

  @override
  void onInit() {
    tabController = TabController(
      length: FeatureManager.featureTabs.length,
      vsync: this,
    );
    super.onInit();
  }
}

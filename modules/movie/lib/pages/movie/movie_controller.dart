import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late final TabController tabController;

  @override
  void onInit() {
    tabController = TabController(length: 3, vsync: this);
    super.onInit();
  }
}

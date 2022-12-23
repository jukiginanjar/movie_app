import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tv/pages/tv/ota_tv_page.dart';
import 'package:tv/pages/tv/popular_tv_page.dart';
import 'package:tv/pages/tv/tv_controller.dart';

class TvPage extends GetView<TvController> {
  const TvPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TV'),
        bottom: TabBar(
          tabs: const [
            Tab(text: 'On the Air'),
            Tab(text: 'Popular'),
          ],
          controller: controller.tabController,
        ),
      ),
      body: TabBarView(
        controller: controller.tabController,
        children: const [
          OtaTvPage(),
          PopularTvPage(),
        ],
      ),
    );
  }
}

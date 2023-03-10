import 'package:app/pages/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:feature_manager/feature_manager.dart';
import 'package:feature_manager/feature_tab.dart';

class MainPage extends GetView<MainController> {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: TabBarView(
          controller: controller.tabController,
          children: FeatureManager.tabPages,
        ),
      ),
      bottomNavigationBar: Material(
        child: SafeArea(
          top: false,
          child: TabBar(
            labelPadding: const EdgeInsets.all(12),
            indicatorColor: Colors.transparent,
            tabs: List.generate(
              FeatureManager.featureTabs.length,
              (index) => BottomBarItem(FeatureManager.featureTabs[index]),
            ),
            controller: controller.tabController,
          ),
        ),
      ),
    );
  }
}

class BottomBarItem extends StatelessWidget {
  const BottomBarItem(this.tab, {super.key});

  final FeatureTab tab;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(tab.icon),
        Text(tab.title),
      ],
    );
  }
}

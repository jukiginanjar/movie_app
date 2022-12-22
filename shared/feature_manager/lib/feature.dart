import 'package:get/get.dart';
import 'package:feature_manager/feature_tab.dart';

abstract class Feature {
  FeatureTab get tab;

  List<GetPage> get routes;
}
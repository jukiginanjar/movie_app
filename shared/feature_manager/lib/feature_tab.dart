import 'package:flutter/material.dart';

abstract class FeatureTab {
  FeatureTabPage get page;

  IconData get icon;

  String get title;
}

abstract class FeatureTabPage {
  Widget get widget;

  void dependencies();
}

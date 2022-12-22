import 'package:account/pages/account_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:platform/feature.dart';
import 'package:platform/feature_tab.dart';

class AccountFeature implements Feature {
  @override
  List<GetPage> get routes => [];

  @override
  FeatureTab get tab => AccountFeatureTab();
}

class AccountFeatureTab implements FeatureTab {
  @override
  IconData get icon => Icons.person;

  @override
  String get title => 'Account';

  @override
  FeatureTabPage get page => AccountFeatureTabPage();
}

class AccountFeatureTabPage implements FeatureTabPage {
  @override
  void dependencies() {}

  @override
  Widget get widget => const AccountPage();
}

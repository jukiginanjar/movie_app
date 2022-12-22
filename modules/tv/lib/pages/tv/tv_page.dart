import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tv/pages/tv/tv_controller.dart';

class TvPage extends GetView<TvController> {
  const TvPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('TV'),);
  }
}
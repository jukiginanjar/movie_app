import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tv/pages/detail/tv_detail_controller.dart';

class TvDetailPage extends GetView<TvDetailController> {
  const TvDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Tv Detail'),);
  }
}
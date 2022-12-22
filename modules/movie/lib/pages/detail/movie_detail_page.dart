import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:movie/pages/detail/movie_detail_controller.dart';

class MovieDetailPage extends GetView<MovieDetailController> {
  const MovieDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Movie Detail'),
    );
  }
}

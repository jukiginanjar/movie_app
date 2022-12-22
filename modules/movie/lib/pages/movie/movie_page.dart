import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:movie/pages/movie/movie_controller.dart';

class MoviePage extends GetView<MovieController> {
  const MoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Movie'),
    );
  }
}

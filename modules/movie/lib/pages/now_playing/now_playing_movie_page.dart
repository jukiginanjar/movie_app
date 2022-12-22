import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:movie/pages/now_playing/now_playing_movie_controller.dart';

class NowPlayingMoviePage extends GetView<NowPlayingMovieController> {
  const NowPlayingMoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.5,
        ),
        itemBuilder: (context, index) => Stack(
          children: [

          ],
        ),
        itemCount: state!.length,
      ),
    );
  }
}

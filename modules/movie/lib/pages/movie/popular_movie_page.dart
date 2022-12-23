import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie/states/popular_movie_state.dart';

class PopularMoviePage extends StatelessWidget {
  const PopularMoviePage(this.state, {super.key});

  final PopularMovieState state;

  @override
  Widget build(BuildContext context) {
    return state.obx(
      (state) => GridView.builder(
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.66,
        ),
        itemBuilder: (context, index) => InkWell(
          onTap: () => Get.toNamed('/movie_detail', arguments: state[index]),
          child: Stack(
            fit: StackFit.expand,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl: state[index].thumbnailUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
        itemCount: state!.length,
      ),
    );
  }
}

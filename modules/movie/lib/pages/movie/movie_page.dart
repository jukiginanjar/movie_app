import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie/pages/movie/movie_controller.dart';
import 'package:movie/pages/movie/now_playing_movie_page.dart';
import 'package:movie/pages/movie/popular_movie_page.dart';
import 'package:movie/pages/movie/upcoming_movie_page.dart';

class MoviePage extends GetView<MovieController> {
  const MoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie'),
        bottom: TabBar(
          tabs: const [
            Tab(text: 'Now Playing'),
            Tab(text: 'Upcoming'),
            Tab(text: 'Popular'),
          ],
          controller: controller.tabController,
        ),
      ),
      body: TabBarView(
        controller: controller.tabController,
        children: [
          NowPlayingMoviePage(controller.nowPlayingState),
          UpcomingMoviePage(controller.upcomingMovieState),
          PopularMoviePage(controller.popularMovieState),
        ],
      ),
    );
  }
}

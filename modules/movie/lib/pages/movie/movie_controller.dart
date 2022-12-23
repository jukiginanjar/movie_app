import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie/states/now_playing_state.dart';
import 'package:movie/states/popular_movie_state.dart';
import 'package:movie/states/upcoming_movie_state.dart';

class MovieController extends GetxController
    with GetSingleTickerProviderStateMixin {
  MovieController(
    this.nowPlayingState,
    this.upcomingMovieState,
    this.popularMovieState,
  );

  final NowPlayingState nowPlayingState;
  final UpcomingMovieState upcomingMovieState;
  final PopularMovieState popularMovieState;

  late final TabController tabController;

  @override
  void onInit() {
    tabController = TabController(length: 3, vsync: this);

    getAllData();

    super.onInit();
  }

  void getAllData() {
    nowPlayingState.getData();
    upcomingMovieState.getData();
    popularMovieState.getData();
  }
}

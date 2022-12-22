import 'package:data/repositories/movie_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late final TabController tabController;

  final MovieRepository movieRepository;

  MovieController(this.movieRepository);

  @override
  void onInit() {
    tabController = TabController(length: 3, vsync: this);
    super.onInit();
  }

  void getData() {
    movieRepository.getNowPlayingMovies();
  }
}

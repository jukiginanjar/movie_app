import 'package:data/models/movie_model.dart';
import 'package:data/repositories/movie_repository.dart';
import 'package:get/get.dart';

class UpcomingMovieState extends GetxController
    with StateMixin<List<MovieModel>> {
  final MovieRepository movieRepo;

  UpcomingMovieState(this.movieRepo);

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  void getData() async {
    try {
      change(null, status: RxStatus.loading());
      final result = await movieRepo.getUpcomingMovies();
      change(result, status: RxStatus.success());
    } catch (e) {
      change(state, status: RxStatus.error(e.toString()));
    }
  }
}

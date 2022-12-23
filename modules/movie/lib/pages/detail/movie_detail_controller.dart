import 'package:data/models/movie_model.dart';
import 'package:get/get.dart';
import 'package:movie/states/movie_reviews_state.dart';

class MovieDetailController extends GetxController {
  final MovieModel movieModel;
  final MovieReviewsState reviewsState;

  MovieDetailController(this.movieModel, this.reviewsState);

  @override
  void onInit() {
    super.onInit();
    reviewsState.getData(movieModel.id);
  }
}

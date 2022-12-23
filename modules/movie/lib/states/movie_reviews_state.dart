import 'package:data/models/review_model.dart';
import 'package:data/repositories/review_repository.dart';
import 'package:get/get.dart';

class MovieReviewsState extends GetxController
    with StateMixin<List<ReviewModel>> {
  final ReviewRepository reviewRepository;

  MovieReviewsState(this.reviewRepository);

  void getData(int movieId) async {
    try {
      change(null, status: RxStatus.loading());
      final result = await reviewRepository.getMovieReviews(movieId);
      change(result, status: RxStatus.success());
    } catch (e) {
      change(state, status: RxStatus.error(e.toString()));
    }
  }
}

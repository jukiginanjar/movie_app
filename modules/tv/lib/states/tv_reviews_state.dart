import 'package:data/models/review_model.dart';
import 'package:data/repositories/review_repository.dart';
import 'package:get/get.dart';

class TvReviewsState extends GetxController with StateMixin<List<ReviewModel>> {
  final ReviewRepository reviewRepository;

  TvReviewsState(this.reviewRepository);

  void getData(int tvId) async {
    try {
      change(null, status: RxStatus.loading());
      final result = await reviewRepository.getTvReviews(tvId);
      if (result.isEmpty) {
        change(result, status: RxStatus.empty());
      } else {
        change(result, status: RxStatus.success());
      }
    } catch (e) {
      change(state, status: RxStatus.error(e.toString()));
    }
  }
}

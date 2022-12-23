import 'package:data/models/tv_model.dart';
import 'package:get/get.dart';
import 'package:tv/states/tv_reviews_state.dart';

class TvDetailController extends GetxController {
  TvDetailController(this.tvModel, this.reviewsState);

  final TvModel tvModel;
  final TvReviewsState reviewsState;

  @override
  void onInit() {
    super.onInit();
    reviewsState.getData(tvModel.id);
  }
}
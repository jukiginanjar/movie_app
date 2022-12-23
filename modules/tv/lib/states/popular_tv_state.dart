import 'package:data/models/tv_model.dart';
import 'package:data/repositories/tv_repository.dart';
import 'package:get/get.dart';

class PopularTvState extends GetxController with StateMixin<List<TvModel>> {
  final TvRepository tvRepo;

  PopularTvState(this.tvRepo);

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  void getData() async {
    try {
      change(null, status: RxStatus.loading());
      final result = await tvRepo.getPopularTvs();
      change(result, status: RxStatus.success());
    } catch (e) {
      change(state, status: RxStatus.error(e.toString()));
    }
  }
}

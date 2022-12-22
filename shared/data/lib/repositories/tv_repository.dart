import 'package:data/helper/cast.dart';
import 'package:data/models/tv_model.dart';
import 'package:data/sources/movie_db_source.dart';

abstract class TvRepository {
  Future<List<TvModel>> getOnTheAirTvs();

  Future<List<TvModel>> getPopularTvs();
}

class TvRepositoryImpl implements TvRepository {
  final _source = MovieDbSource();

  @override
  Future<List<TvModel>> getOnTheAirTvs() {
    return _source.getOnTheAirTvs().then((value) => _mapToModels(value));
  }

  @override
  Future<List<TvModel>> getPopularTvs() {
    return _source.getPopularTvs().then((value) => _mapToModels(value));
  }

  List<TvModel> _mapToModels(value) {
    final results = cast(value['results'], defaultValue: []);
    return results.map((e) => TvModel.fromMap(e)).toList();
  }
}

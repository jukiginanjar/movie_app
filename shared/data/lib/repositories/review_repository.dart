import 'package:data/helper/cast.dart';
import 'package:data/models/review_model.dart';
import 'package:data/sources/movie_db_source.dart';

abstract class ReviewRepository {
  Future<List<ReviewModel>> getMovieReviews(int movieId);

  Future<List<ReviewModel>> getTvReviews(int tvId);
}

class ReviewRepositoryImpl implements ReviewRepository {
  final _source = MovieDbSource();

  @override
  Future<List<ReviewModel>> getMovieReviews(int movieId) {
    return _source.getMovieReviews(movieId).then((value) {
      final results = cast(value['results'], defaultValue: []);
      return results.map((e) => ReviewModel.fromMap(e)).toList();
    });
  }

  @override
  Future<List<ReviewModel>> getTvReviews(int tvId) {
    return _source.getTvReviews(tvId).then((value) {
      final results = cast(value['results'], defaultValue: []);
      return results.map((e) => ReviewModel.fromMap(e)).toList();
    });
  }
}

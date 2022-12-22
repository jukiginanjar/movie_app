import 'package:data/helper/cast.dart';
import 'package:data/models/movie_model.dart';
import 'package:data/sources/movie_db_source.dart';

abstract class MovieRepository {
  Future<List<MovieModel>> getNowPlayingMovies();

  Future<List<MovieModel>> getUpcomingMovies();

  Future<List<MovieModel>> getPopularMovies();
}

class MovieRepositoryImpl implements MovieRepository {
  final _source = MovieDbSource();

  @override
  Future<List<MovieModel>> getNowPlayingMovies() {
    return _source.getNowPlayingMovies().then((value) => _mapToModels(value));
  }

  @override
  Future<List<MovieModel>> getUpcomingMovies() {
    return _source.getUpcomingMovies().then((value) => _mapToModels(value));
  }

  @override
  Future<List<MovieModel>> getPopularMovies() {
    return _source.getPopularMovies().then((value) => _mapToModels(value));
  }

  List<MovieModel> _mapToModels(value) {
    final results = cast(value['results'], defaultValue: []);
    return results.map((e) => MovieModel.fromMap(e)).toList();
  }
}

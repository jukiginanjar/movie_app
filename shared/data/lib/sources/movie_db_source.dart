import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class MovieDbSource {
  static const _apiKey = '3ffa304d5fcbae1f59e67458f640ab55';
  static const _baseUrl = 'https://api.themoviedb.org/3';

  late final _dio = _buildDioObject();

  Future<dynamic> getNowPlayingMovies() {
    return _get(path: '/movie/now_playing', queryParameters: {'page': 1});
  }

  Future<dynamic> getUpcomingMovies() {
    return _get(path: '/movie/upcoming', queryParameters: {'page': 1});
  }

  Future<dynamic> getPopularMovies() {
    return _get(path: '/movie/popular', queryParameters: {'page': 1});
  }

  Future<dynamic> getMovieReviews(int movieId) {
    return _get(path: '/movie/$movieId/reviews', queryParameters: {'page': 1});
  }

  Future<dynamic> getOnTheAirTvs() {
    return _get(path: '/tv/on_the_air', queryParameters: {'page': 1});
  }

  Future<dynamic> getPopularTvs() {
    return _get(path: '/tv/popula', queryParameters: {'page': 1});
  }

  Future<dynamic> getTvReviews(int tvId) {
    return _get(path: '/tv/$tvId/reviews', queryParameters: {'page': 1});
  }

  Future<dynamic> _get({
    required String path,
    Map<String, dynamic>? queryParameters,
  }) {
    var query = queryParameters ?? {};
    query['api_key'] = _apiKey;
    return _dio.get(path, queryParameters: query).then((value) => value.data);
  }

  Dio _buildDioObject() {
    var result = Dio(
      BaseOptions(baseUrl: _baseUrl),
    );
    if (kDebugMode) {
      result.interceptors
          .add(LogInterceptor(requestBody: true, responseBody: true));
    }
    return result;
  }
}

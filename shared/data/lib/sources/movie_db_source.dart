import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class MovieDbSource {
  static const _apiKey = '3ffa304d5fcbae1f59e67458f640ab55';
  static const _baseUrl = 'https://api.themoviedb.org/3';

  late final dio = _buildDioObject();

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

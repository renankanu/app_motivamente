import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'i_custom_dio.dart';

class RestClientDio implements ICustomDio {
  RestClientDio(String baseUrl) {
    _setup(baseUrl: baseUrl);
  }

  late Dio _dio;

  void _setup({required String baseUrl}) {
    final BaseOptions baseOptions = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 6),
      receiveTimeout: const Duration(seconds: 6),
    );
    _dio = Dio(baseOptions);
    _dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
    ));
  }

  @override
  Future<Map<String, dynamic>> get(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.get<dynamic>(
        path,
        queryParameters: queryParameters,
        options: Options(headers: headers),
      );
      final map = response.data as Map<String, dynamic>;
      return map;
    } on DioError catch (_) {
      rethrow;
    }
  }
}

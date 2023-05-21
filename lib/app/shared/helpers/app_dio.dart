import 'package:dio/dio.dart';

class AppDio {
  const AppDio._();
  static final Dio _dio = Dio();

  static Dio initSlice() {
    _dio.options.baseUrl = 'https://api.adviceslip.com/advice';
    _dio.options.connectTimeout = const Duration(seconds: 5);
    _dio.options.receiveTimeout = const Duration(seconds: 5);
    _dio.options.headers['Content-Type'] = 'application/json';
    return _dio;
  }

  static Dio initChatGpt() {
    _dio.options.baseUrl = 'https://api.openai.com/v1/completions';
    _dio.options.connectTimeout = const Duration(seconds: 5);
    _dio.options.receiveTimeout = const Duration(seconds: 5);
    _dio.options.headers['Content-Type'] = 'application/json';
    return _dio;
  }
}

abstract class ICustomDio {
  Future<Map<String, dynamic>> get(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });
}

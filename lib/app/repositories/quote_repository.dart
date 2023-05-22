import '../model/quotable_message.dart';
import '../shared/custom_dio/rest_client_dio.dart';

class QuoteRepository {
  QuoteRepository(this.customDio);

  final RestClientDio customDio;

  Future<QuotableMessage> fetchQuote() async {
    final response = await customDio.get(
      '/random',
    );
    return QuotableMessage.fromJson(response);
  }
}

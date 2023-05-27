import 'package:supabase_flutter/supabase_flutter.dart';

import '../model/quote.dart';
import '../shared/custom_dio/rest_client_dio.dart';

class QuoteRepository {
  QuoteRepository(this.customDio);

  final RestClientDio customDio;
  final supabase = Supabase.instance.client;

  Future<Quote> fetchQuote(int id) async {
    final data = await supabase.from('quotes').select().eq('id', id);
    final responseMap = data[0] as Map<String, dynamic>;
    return Quote.fromJson(responseMap);
  }

  Future<int> getCount() async {
    final data = await supabase.from('quote_count').select('count');
    final responseMap = data[0] as Map<String, dynamic>;
    return responseMap['count'] as int;
  }
}

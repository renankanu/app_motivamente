import 'package:supabase_flutter/supabase_flutter.dart';

import '../model/quote.dart';
import '../shared/custom_dio/rest_client_dio.dart';

class QuoteRepository {
  QuoteRepository(this.customDio);

  final RestClientDio customDio;
  final supabase = Supabase.instance.client;

  Future<Quote> fetchQuote() async {
    final data = await supabase.from('quotes').select().eq('id', 2);
    final responseMap = data[0] as Map<String, dynamic>;
    return Quote.fromJson(responseMap);
  }
}

import 'package:get_it/get_it.dart';

import 'app/bloc/message/message_controller.dart';
import 'app/repositories/quote_repository.dart';
import 'app/shared/custom_dio/rest_client_dio.dart';

final locator = GetIt.instance;

void init() {
  // bloc
  locator.registerFactory(() => MessageController(locator()));

  //repository
  locator.registerLazySingleton<QuoteRepository>(
    () => QuoteRepository(locator()),
  );

  //custom dio
  locator.registerSingleton(RestClientDio('https://api.quotable.io'));
}

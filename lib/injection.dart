import 'package:get_it/get_it.dart';

import 'app/shared/helpers/app_dio.dart';

final locator = GetIt.instance;

void init() {
  locator.registerSingleton(AppDio.initSlice());
  locator.registerSingleton(AppDio.initChatGpt());
}

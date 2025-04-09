import 'dart:io';

import 'package:example_app/src/core/config/enums/app_env.dart';
import 'package:example_app/src/core/network/api_provider.dart';
import 'package:example_app/src/core/utils/log_utils.dart';
import 'package:example_app/src/features/weather/data/weather_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

/// Global [GetIt.instance].
final GetIt locator = GetIt.instance;

/// Set up [GetIt] locator.
Future<void> setUpLocator(AppEnv env) async {
  final File logOutputFile = await LogUtil.initLogFile();
  final APIProvider apiProvider = APIProvider(env);

  locator
    ..registerSingleton<Logger>(
      Logger(
        printer: LogUtil.logPrinter,
        output: LogUtil.logOutput(logOutputFile),
      ),
    )
    ..registerSingleton(WeatherRepository(apiProvider: apiProvider));
}
